%%  清空环境变量
clc  
clear         
close all              
warning off   

rng(0)      
%%  导入数据
load MFAGNet 
res=data;
%%  随机划分训练集和测试集

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
%% 数据归一化
[p_train, ps_input] = mapminmax(P_train,0,1);
p_test = mapminmax('apply',P_test,ps_input);
t_train = T_train;
t_test = T_test;
%%  数据平铺
p_train =  double(reshape(p_train,36,1,1,M));
p_test  =  double(reshape(p_test,36,1,1,N));
t_train =  categorical(t_train)';
t_test  =  categorical(t_test)';

%% 构造网络
lgraph = [
    imageInputLayer([36 1 1],"Name","imageinput")
    
    convolution2dLayer([2 1],72,"Name","conv_1",Stride=1)
    batchNormalizationLayer("Name","batchnorm_1")
    reluLayer("Name","relu_1")
    convolution2dLayer([2 1],72,"Name","conv_2",Stride=1)
    batchNormalizationLayer("Name","batchnorm_2")
    reluLayer("Name","relu_2")
    convolution2dLayer([2 1],72,"Name","conv_3",Stride=1)
    batchNormalizationLayer("Name","batchnorm_3")
    reluLayer("Name","relu_3")
    flattenLayer("Name","flatten") 
    lstmLayer(128,"Name","lstm1")
    lstmLayer(128,"Name","lstm2")
    lstmLayer(128,"Name","lstm3")
    selfAttentionLayer(1,50,"Name","selfattention")
    fullyConnectedLayer(6,"Name","fc")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];

%% 参数设置
options = trainingOptions('adam',...     
    'MiniBatchSize',50,...              
    'MaxEpochs',40,...                
    'InitialLearnRate',0.01,... 
    'LearnRateSchedule','none',...      
    'LearnRateDropFactor',0.1,...        
    'LearnRateDropPeriod',35,...        
    'Shuffle','every-epoch',...          
    'ValidationPatience',Inf,...         
    'Verbose',true);
    'Plots','training-progress',...     

%% 训练
[net info] = trainNetwork(p_train,t_train,lgraph,options);

%%  测试集预测
t_sim2 = predict(net,p_test);

%% 反编码

T_sim2 = vec2ind(t_sim2');
tsmvalue = T_sim2;
load Result
%% 性能评价

error2 = sum((T_sim2 == T_test))/N;
R=1-error2;
disp(['分类精度为:', num2str(error2.*100),'%']);


%%  绘图
figure
plot(1: N, T_test, 'r*', 1: N, T_sim2, 'bo', 'LineWidth', 1)
legend('真实值', 'CNN_LSTM预测值')
xlabel('预测样本')
ylabel('预测结果')
string = {'测试集预测结果对比'; ['准确率=' num2str(error2) '%']};
title(string)
xlim([1, N])
grid

%%  混淆矩阵
figure
cm = confusionchart(T_test, T_sim2);
cm.Title = 'Confusion Matrix for Test Data';
cm.ColumnSummary = 'column-normalized';
cm.RowSummary = 'row-normalized';

