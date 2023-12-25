%%  清空环境变量
warning off             % 关闭报警信息
close all               % 关闭开启的图窗
clear                   % 清空变量
clc                     % 清空命令行

%%  导入数据
% load FDE
% load EFDE
% load EFDEα
% load WEFDEα
% load VMD-WEFDEα
% load SSD-WEFDEα
% load FE
% load SE
% load Marine organism signal recognition
load WEFDEα
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

%% 数据预处理
% 数据预处理,将训练集和测试集归一化到[0,1]区间
[mtrain,ntrain] = size(P_train);
[mtest,ntest] = size(P_test);
dataset = [P_train;P_test];
% mapminmax为MATLAB自带的归一化函数
[dataset_scale,ps] = mapminmax(dataset',0,1);
dataset_scale = dataset_scale';
P_train = dataset_scale(1:mtrain,:);
P_test = dataset_scale( (mtrain+1):(mtrain+mtest),: );
%% 智能算法优化SVM训练，若使用网络训练将这部分与下面优化部分删除即可。
tic
%%  参数设置
fun = @getObjValue; 
% 优化参数的个数 (c、g)
dim = 2;
% 优化参数的取值下限
lb = [10^-1, 2^-5];
ub = [10^1, 2^8];

%%  参数设置
pop =50; %种群数量
Max_iteration=100;%最大迭代次数             
%% 优化(这里主要调用函数)
[Best_score,Best_pos,curve]=SO(pop,Max_iteration,lb,ub,dim,fun); 
c = Best_pos(1, 1);  
g = Best_pos(1, 2); 
toc

cmd = ['-s 0 -t 2 ', '-c ', num2str(c), ' -g ', num2str(g), ' -q'];
model = libsvmtrain(T_train, P_train, cmd);

%% SVM网络预测
[T_sim1, accuracy1,decision_values] = libsvmpredict(T_train, P_train, model);
[T_sim2, accuracy2,decision_values] = libsvmpredict(T_test, P_test, model);
%% 性能评价
load WEFDEα_result.mat
error1 = sum((T_sim1 == T_train))/M * 100 ;
error2 = sum((T_sim2 == T_test))/N * 100 ;

%%  绘图
figure
plot(1: M, T_train, 'r*', 1: M, T_sim1, 'bo', 'LineWidth', 1)
legend('真实值', 'SO-SVM预测值')
xlabel('预测样本')
ylabel('预测结果')
string = {'训练集预测结果对比'; ['准确率=' num2str(error1) '%']};
title(string)
xlim([1, M])
grid

figure
plot(1: N, T_test, 'r*', 1: N, T_sim2, 'bo', 'LineWidth', 1)
legend('真实值', 'SO-SVM预测值')
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
