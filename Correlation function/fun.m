function fitness = fun(x,P_train,T_train,P_test,T_test)
initAlpha	= x(1); %�������ı�����ʼֵ
initBeta	= 0; %�����������ֵ
kernel_	= 'gauss';%kernel_����
width = x(2);  %kernel��Ȳ���
useBias	= true;
maxIts	= 50;%����������
monIts = round(maxIts);%ÿ���ٴ���ʾһ����Ϣ
%%  ѵ��ģ��
[weights, used, bias, marginal, alpha, beta, gamma] = ...
    SB1_RVM(P_train,T_train,initAlpha,initBeta,kernel_,width,useBias,maxIts,monIts);
%% ѵ����Ԥ��
PHI	= SB1_KernelFunction(P_train,P_train(used,:),kernel_,width);
predictTrain= PHI*weights + bias;
predictTrainLabelout = zeros(size(predictTrain));
predictTrainLabelout(predictTrain>0) = 1;
ErrorTrain = predictTrainLabelout - T_train; %
accruacyTrain = sum(ErrorTrain==0)/length(ErrorTrain);%ѵ����׼ȷ��
%% ���Լ�Ԥ��
PHI	= SB1_KernelFunction(P_test,P_train(used,:),kernel_,width);
predictTest= PHI*weights + bias;
predictTestLabelout = zeros(size(predictTest));
predictTestLabelout(predictTest>0) = 1;
ErrorTest = predictTestLabelout - T_test; %�������
accruacyTest = sum(ErrorTest==0)/length(ErrorTest);%���Լ�׼ȷ��
fitness = 1 - accruacyTrain - accruacyTest;
end