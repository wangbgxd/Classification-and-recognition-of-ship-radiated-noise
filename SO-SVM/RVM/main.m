clc  
% clear         
close all              
warning off                   
tic               
%%  ��������
load WEFDE��_ShipsEar
%%  ����ѵ�����Ͳ��Լ�
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

P_test=P_test'
P_train=P_train'

T_train=T_train'
T_test=T_test'

%%  ���ݹ�һ��
[p_train, ps_input] = mapminmax(P_train, 0, 1);
p_test  = mapminmax('apply', P_test, ps_input);
t_train = T_train;
t_test  = T_test ;

%%  ����ģ��
num = 4;        
model = 'sig';  
[IW, B, LW, TF, TYPE] = RVM(p_train, t_train, num, model, 1);

%%  �������
T_sim1 = elmpredict(p_train, IW, B, LW, TF, TYPE);
T_sim2 = elmpredict(p_test , IW, B, LW, TF, TYPE);
%%  ��������
[T_train, index_1] = sort(T_train);
[T_test , index_2] = sort(T_test );

T_sim1 = T_sim1(index_1);
T_sim2 = T_sim2(index_2);
load WEFDE��_ShipsEar_result
%%  ��������
error1 = sum((T_sim1 == T_train)) / M * 100 ;
error2 = sum((T_sim2 == T_test )) / N * 100 ;

%%  ��ͼ
figure
plot(1: M, T_train, 'r-*', 1: M, T_sim1, 'b-o', 'LineWidth', 1)
legend('��ʵֵ', 'Ԥ��ֵ')
xlabel('Ԥ������')
ylabel('Ԥ����')
string = {'ѵ����Ԥ�����Ա�'; ['׼ȷ��=' num2str(error1) '%']};
title(string)
grid

figure
plot(1: N, T_test, 'r-*', 1: N, T_sim2, 'b-o', 'LineWidth', 1)
legend('��ʵֵ', 'Ԥ��ֵ')
xlabel('Ԥ������')
ylabel('Ԥ����')
string = {'���Լ�Ԥ�����Ա�'; ['׼ȷ��=' num2str(error2) '%']};
title(string)
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
toc