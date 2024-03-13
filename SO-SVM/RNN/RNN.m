%%  清空环境变量
warning off             % 关闭报警信息
close all               % 关闭开启的图窗
clear                   % 清空变量
clc                     % 清空命令行
tic
%%  导入数据
load WEFDEα_ShipsEar

%%  划分训练集和测试集

%%  分析数据
num_class = length(unique(res(:, end)));  % 类别数（Excel最后一列放类别）
num_res = size(res, 1);                   % 样本数（每一行，是一个样本）
num_size = 0.6;                           % 训练集占数据集的比例
res = res(randperm(num_res), :);          % 打乱数据集（不打乱数据时，注释该行）
flag_conusion = 1;                        % 标志位为1，打开混淆矩阵（要求2018版本及以上）
outdim = 1;                                  % 最后一列为输出
f_ = size(res, 2) - outdim;                  % 输入特征维度
%%  设置变量存储数据
P_train = []; P_test = [];
T_train = []; T_test = [];

%%  划分数据集
for i = 1 : num_class
    mid_res = res((res(:, end) == i), :);           % 循环取出不同类别的样本
    mid_size = size(mid_res, 1);                    % 得到不同类别样本个数
    mid_tiran = round(num_size * mid_size);         % 得到该类别的训练样本个数

    P_train = [P_train; mid_res(1: mid_tiran, 1: end - 1)];       % 训练集输入
    T_train = [T_train; mid_res(1: mid_tiran, end)];              % 训练集输出

    P_test  = [P_test; mid_res(mid_tiran + 1: end, 1: end - 1)];  % 测试集输入
    T_test  = [T_test; mid_res(mid_tiran + 1: end, end)];         % 测试集输出
end

%%  得到训练集和测试样本个数
M = size(P_train, 1);
N = size(P_test , 1);

P_test=P_test'
P_train=P_train'

T_train=T_train'
T_test=T_test'


%%  数据归一化
[P_train, ps_input] = mapminmax(P_train, 0, 1);
P_test = mapminmax('apply', P_test, ps_input);

t_train = categorical(T_train)';
t_test  = categorical(T_test )';

%%  数据平铺

P_train =  double(reshape(P_train, 12, 1, 1, M));
P_test  =  double(reshape(P_test , 12, 1, 1, N));

%%  数据格式转换
for i = 1 : M
    p_train{i, 1} = P_train(:, :, 1, i);
end

for i = 1 : N
    p_test{i, 1} = P_test( :, :, 1, i);
end

%%  创建网络
layers = [ ...
  sequenceInputLayer(12)               
  
  lstmLayer(64, 'OutputMode', 'last')   
  reluLayer                            
  lstmLayer(64, 'OutputMode', 'last')   
  reluLayer                         
  lstmLayer(64, 'OutputMode', 'last') 
  reluLayer                         
  fullyConnectedLayer(4)            
  softmaxLayer                      
  classificationLayer];

%%  参数设置
options = trainingOptions('adam', ...       
    'MaxEpochs', 200, ...                  
    'InitialLearnRate', 0.01, ...          
    'LearnRateSchedule', 'piecewise', ...  
    'LearnRateDropFactor', 0.1, ...        
    'LearnRateDropPeriod', 300, ...      
    'Shuffle', 'every-epoch', ...         
    'ValidationPatience', Inf, ...        
    'Plots', 'training-progress', ...      
    'Verbose', false);

%%  训练模型
net = trainNetwork(p_train, t_train, layers, options);

%%  仿真预测
t_sim1 = predict(net, p_train); 
t_sim2 = predict(net, p_test ); 

%%  数据反归一化
T_sim1 = vec2ind(t_sim1');
T_sim2 = vec2ind(t_sim2');
load WEFDEα_ShipsEar_result
%%  性能评价
error1 = sum((T_sim1 == T_train)) / M * 100 ;
error2 = sum((T_sim2 == T_test )) / N * 100 ;

%%  查看网络结构
% analyzeNetwork(net)

%%  数据排序
[T_train, index_1] = sort(T_train);
[T_test , index_2] = sort(T_test );

T_sim1 = T_sim1(index_1);
T_sim2 = T_sim2(index_2);

%%  绘图
figure
plot(1: M, T_train, 'r-*', 1: M, T_sim1, 'b-o', 'LineWidth', 1)
legend('真实值', '预测值')
xlabel('预测样本')
ylabel('预测结果')
string = {'训练集预测结果对比'; ['准确率=' num2str(error1) '%']};
title(string)
xlim([1, M])
grid

figure
plot(1: N, T_test, 'r-*', 1: N, T_sim2, 'b-o', 'LineWidth', 1)
legend('真实值', '预测值')
xlabel('预测样本')
ylabel('预测结果')
string = {'测试集预测结果对比'; ['准确率=' num2str(error2) '%']};
title(string)
xlim([1, N])
grid

%%  混淆矩阵
figure
cm = confusionchart(T_train, T_sim1);
cm.Title = 'Confusion Matrix for Train Data';
cm.ColumnSummary = 'column-normalized';
cm.RowSummary = 'row-normalized';
    
figure
cm = confusionchart(T_test, T_sim2);
cm.Title = 'Confusion Matrix for Test Data';
cm.ColumnSummary = 'column-normalized';
cm.RowSummary = 'row-normalized';
toc