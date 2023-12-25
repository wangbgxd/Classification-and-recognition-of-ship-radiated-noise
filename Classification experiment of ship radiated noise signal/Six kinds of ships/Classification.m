clc
clear
close all
%%
load SSC_ship1
load SSC_ship2
load SSC_ship3
load SSC_ship4
load SSC_ship5
load SSC_ship6
a=SSC_ship1(1,:);
b=SSC_ship2(1,:);
c=SSC_ship3(2,:);
d=SSC_ship4(1,:);
e=SSC_ship5(1,:);
f=SSC_ship6(1,:);
max_CHIMIC_ship1=[1,0.5529];
max_CHIMIC_ship2=[1,0.9907];
max_CHIMIC_ship3=[2,0.2536];
max_CHIMIC_ship4=[1,0.2052];
max_CHIMIC_ship5=[1,0.3603];
max_CHIMIC_ship6=[1,0.6797];
%% 
for i=1:50                       
p=a(randperm(length(a),500));
P1(:,i)=EFFDispEn(p',3,8,1);
P1(:,i)=max_CHIMIC_ship1(1,2)*P1(:,i);
end
for i=1:50           
p=b(randperm(length(b),500));
P2(:,i)=EFFDispEn(p',3,8,1);
P2(:,i)=max_CHIMIC_ship2(1,2)*P2(:,i);
end
for i=1:50                    
p=c(randperm(length(c),500));
P3(:,i)=EFFDispEn(p',3,8,1);
P3(:,i)=max_CHIMIC_ship3(1,2)*P3(:,i);
end
 for i=1:50             
p=d(randperm(length(d),500));
P4(:,i)=EFFDispEn(p',3,8,1);
P4(:,i)=max_CHIMIC_ship4(1,2)*P4(:,i);
 end
 for i=1:50      
p=e(randperm(length(e),500));
P5(:,i)=EFFDispEn(p',3,8,1);
P5(:,i)=max_CHIMIC_ship5(1,2)*P5(:,i);
 end
for i=1:50               
p=f(randperm(length(f),500));
P6(:,i)=EFFDispEn(p',3,8,1);
P6(:,i)=max_CHIMIC_ship6(1,2)*P6(:,i);
end
% figure
% plot(P1,'-o')
% hold on
% plot(P2,'-*')
% hold on
% plot(P3,'-<')
% hold on
% plot(P4,'->')
% hold on
% plot(P5,'-^')
% hold on
% plot(P6,'-^')
% xlabel('Samples/n')
% ylabel('WEFDEα')
% legend('P1','P2','P3','P4','P5','P6')
% set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',14);
% set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',14);
% set(gca,'FontName','Times New Roman','fontsize',14);

openfig('FDE.fig');
openfig('EFDE.fig');
openfig('EFDEα.fig');
openfig('WEFDEα.fig');
openfig('SE.fig');
openfig('FE.fig');

