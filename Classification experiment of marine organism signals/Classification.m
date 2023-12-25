clc
clear
close all
%%
load Decomposed_SSC_component

a=SSC_Seabird(1,:);
b=SSC_Sperm_whale(1,:);
c=SSC_Sea_lion(1,:);
d=SSC_Chinese_white_dolphin(1,:);

Max_chimic_K1=[1,0.1945];
Max_chimic_K2=[1,0.9147];
Max_chimic_K3=[1,0.4572];
Max_chimic_K4=[1,0.0840];

%% 
for i=1:50                   
p=a(randperm(length(a),500));
K1(:,i)=EFFDispEn(p',3,8,1);
K1(:,i)=Max_chimic_K1(1,2)*K1(:,i);
end
 for i=1:50            
p=b(randperm(length(b),500));
K2(:,i)=EFFDispEn(p',3,8,1);
K2(:,i)=Max_chimic_K2(1,2)*K2(:,i);
 end
 for i=1:50                  
p=c(randperm(length(c),500));
K3(:,i)=EFFDispEn(p',3,8,1);
K3(:,i)=Max_chimic_K3(1,2)*K3(:,i);
 end
for i=1:50              
p=d(randperm(length(d),500));
K4(:,i)=EFFDispEn(p',3,8,1);
K4(:,i)=Max_chimic_K4(1,2)*K4(:,i);
end
figure(1)
plot(K1,'-o')
hold on
plot(K2,'-*')
hold on
plot(K3,'-<')
hold on
plot(K4,'-^')
xlabel('Samples/n')
ylabel('WEFDEα')
legend('K1','K2','K3','K4')
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',14);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',14);
set(gca,'FontName','Times New Roman','fontsize',14);%刻度的大小
openfig('WEFDEα.fig');

