function fitness = fun(x,P_train,T_train,P_test,T_test)
initAlpha	= x(1); %超参数的标量初始值
initBeta	= 0; %逆噪声方差初值
kernel_	= 'gauss';%kernel_类型
width = x(2);  %kernel宽度参数
useBias	= true;
maxIts	= 50;%最大迭代次数
monIts = round(maxIts);%每多少代显示一次信息
%%  训练模型
[weights, used, bias, marginal, alpha, beta, gamma] = ...
    SB1_RVM(P_train,T_train,initAlpha,initBeta,kernel_,width,useBias,maxIts,monIts);
%% 训练集预测
PHI	= SB1_KernelFunction(P_train,P_train(used,:),kernel_,width);
predictTrain= PHI*weights + bias;
predictTrainLabelout = zeros(size(predictTrain));
predictTrainLabelout(predictTrain>0) = 1;
ErrorTrain = predictTrainLabelout - T_train; %
accruacyTrain = sum(ErrorTrain==0)/length(ErrorTrain);%训练集准确率
%% 测试集预测
PHI	= SB1_KernelFunction(P_test,P_train(used,:),kernel_,width);
predictTest= PHI*weights + bias;
predictTestLabelout = zeros(size(predictTest));
predictTestLabelout(predictTest>0) = 1;
ErrorTest = predictTestLabelout - T_test; %误差曲线
accruacyTest = sum(ErrorTest==0)/length(ErrorTest);%测试集准确率
fitness = 1 - accruacyTrain - accruacyTest;
end