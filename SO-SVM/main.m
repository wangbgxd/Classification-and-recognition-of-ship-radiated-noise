%%  ��ջ�������
warning off             % �رձ�����Ϣ
close all               % �رտ�����ͼ��
clear                   % ��ձ���
clc                     % ���������

%%  ��������
% load FDE
% load EFDE
% load EFDE��
% load WEFDE��
% load VMD-WEFDE��
% load SSD-WEFDE��
% load FE
% load SE
% load Marine organism signal recognition
load WEFDE��
%%  ��������
num_class = length(unique(res(:, end)));  % �������Excel���һ�з����
num_res = size(res, 1);                   % ��������ÿһ�У���һ��������
num_size = 0.6;                           % ѵ����ռ���ݼ��ı���
res = res(randperm(num_res), :);          % �������ݼ�������������ʱ��ע�͸��У�
flag_conusion = 1;                        % ��־λΪ1���򿪻�������Ҫ��2018�汾�����ϣ�
outdim = 1;                                  % ���һ��Ϊ���
f_ = size(res, 2) - outdim;                  % ��������ά��
%%  ���ñ����洢����
P_train = []; P_test = [];
T_train = []; T_test = [];

%%  �������ݼ�
for i = 1 : num_class
    mid_res = res((res(:, end) == i), :);           % ѭ��ȡ����ͬ��������
    mid_size = size(mid_res, 1);                    % �õ���ͬ�����������
    mid_tiran = round(num_size * mid_size);         % �õ�������ѵ����������

    P_train = [P_train; mid_res(1: mid_tiran, 1: end - 1)];       % ѵ��������
    T_train = [T_train; mid_res(1: mid_tiran, end)];              % ѵ�������

    P_test  = [P_test; mid_res(mid_tiran + 1: end, 1: end - 1)];  % ���Լ�����
    T_test  = [T_test; mid_res(mid_tiran + 1: end, end)];         % ���Լ����
end

%%  �õ�ѵ�����Ͳ�����������
M = size(P_train, 1);
N = size(P_test , 1);

%% ����Ԥ����
% ����Ԥ����,��ѵ�����Ͳ��Լ���һ����[0,1]����
[mtrain,ntrain] = size(P_train);
[mtest,ntest] = size(P_test);
dataset = [P_train;P_test];
% mapminmaxΪMATLAB�Դ��Ĺ�һ������
[dataset_scale,ps] = mapminmax(dataset',0,1);
dataset_scale = dataset_scale';
P_train = dataset_scale(1:mtrain,:);
P_test = dataset_scale( (mtrain+1):(mtrain+mtest),: );
%% �����㷨�Ż�SVMѵ������ʹ������ѵ�����ⲿ���������Ż�����ɾ�����ɡ�
tic
%%  ��������
fun = @getObjValue; 
% �Ż������ĸ��� (c��g)
dim = 2;
% �Ż�������ȡֵ����
lb = [10^-1, 2^-5];
ub = [10^1, 2^8];

%%  ��������
pop =50; %��Ⱥ����
Max_iteration=100;%����������             
%% �Ż�(������Ҫ���ú���)
[Best_score,Best_pos,curve]=SO(pop,Max_iteration,lb,ub,dim,fun); 
c = Best_pos(1, 1);  
g = Best_pos(1, 2); 
toc

cmd = ['-s 0 -t 2 ', '-c ', num2str(c), ' -g ', num2str(g), ' -q'];
model = libsvmtrain(T_train, P_train, cmd);

%% SVM����Ԥ��
[T_sim1, accuracy1,decision_values] = libsvmpredict(T_train, P_train, model);
[T_sim2, accuracy2,decision_values] = libsvmpredict(T_test, P_test, model);
%% ��������
load WEFDE��_result.mat
error1 = sum((T_sim1 == T_train))/M * 100 ;
error2 = sum((T_sim2 == T_test))/N * 100 ;

%%  ��ͼ
figure
plot(1: M, T_train, 'r*', 1: M, T_sim1, 'bo', 'LineWidth', 1)
legend('��ʵֵ', 'SO-SVMԤ��ֵ')
xlabel('Ԥ������')
ylabel('Ԥ����')
string = {'ѵ����Ԥ�����Ա�'; ['׼ȷ��=' num2str(error1) '%']};
title(string)
xlim([1, M])
grid

figure
plot(1: N, T_test, 'r*', 1: N, T_sim2, 'bo', 'LineWidth', 1)
legend('��ʵֵ', 'SO-SVMԤ��ֵ')
xlabel('Ԥ������')
ylabel('Ԥ����')
string = {'���Լ�Ԥ�����Ա�'; ['׼ȷ��=' num2str(error2) '%']};
title(string)
xlim([1, N])
grid

%%  ��������
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
