clc
clear
close all  
%% VMD
load ship
% [imf1, u_hat, omega] = VMD(ship1,2000,0,8,0,1,1e-6);
% [imf2, u_hat, omega] = VMD(ship2,2000,0,8,0,1,1e-6);
% [imf3, u_hat, omega] = VMD(ship3,2000,0,8,0,1,1e-6);
% [imf4, u_hat, omega] = VMD(ship4,2000,0,8,0,1,1e-6);
% [imf5, u_hat, omega] = VMD(ship5,2000,0,8,0,1,1e-6);
% [imf6, u_hat, omega] = VMD(ship6,2000,0,8,0,1,1e-6);
% load vmd_imf
% a=imf1(1,:);
% b=imf2(1,:);
% c=imf3(2,:);
% d=imf4(2,:);
% e=imf5(1,:);
% f=imf6(1,:);
% max_CHIMIC_ship1=[1,0.3839];
% max_CHIMIC_ship2=[1,0.5634];
% max_CHIMIC_ship3=[2,0.1738];
% max_CHIMIC_ship4=[2,0.2511];
% max_CHIMIC_ship5=[1,0.4296];
% max_CHIMIC_ship6=[1,0.6952];
%% SSD
load SSD_SSC
% SSC1=SAM_SSD(ship1,2000);
% SSC2=SAM_SSD(ship2,2000);
% SSC3=SAM_SSD(ship3,2000);
% SSC4=SAM_SSD(ship4,2000);
% SSC5=SAM_SSD(ship5,2000);
% SSC6=SAM_SSD(ship6,2000);
a=SSC1(6,:);
b=SSC2(4,:);
c=SSC3(4,:);
d=SSC4(4,:);
e=SSC5(7,:);
f=SSC6(4,:);
max_CHIMIC_ship1=[6,0.3410];
max_CHIMIC_ship2=[4,0.7958];
max_CHIMIC_ship3=[4,0.2742];
max_CHIMIC_ship4=[4,0.3092];
max_CHIMIC_ship5=[7,0.3666];
max_CHIMIC_ship6=[4,0.6941];


%% 
for i=1:50                       
p=a(randperm(length(a),500));
P1(:,i)=FEFDispEn(p',3,8,1);
P1(:,i)=max_CHIMIC_ship1(1,2)*P1(:,i);
end
 for i=1:50             
p=b(randperm(length(b),500));
P2(:,i)=FEFDispEn(p',3,8,1);
P2(:,i)=max_CHIMIC_ship2(1,2)*P2(:,i);
 end
 for i=1:50                       
p=c(randperm(length(c),500));
P3(:,i)=FEFDispEn(p',3,8,1);
P3(:,i)=max_CHIMIC_ship3(1,2)*P3(:,i);
 end
 for i=1:50                  
p=d(randperm(length(d),500));
P4(:,i)=FEFDispEn(p',3,8,1);
P4(:,i)=max_CHIMIC_ship4(1,2)*P4(:,i);
 end
 for i=1:50            
p=e(randperm(length(e),500));
P5(:,i)=FEFDispEn(p',3,8,1);
P5(:,i)=max_CHIMIC_ship5(1,2)*P5(:,i);
 end
 for i=1:50               
p=f(randperm(length(f),500));
P6(:,i)=FEFDispEn(p',3,8,1);
P6(:,i)=max_CHIMIC_ship6(1,2)*P6(:,i);
 end
%  
figure
plot(P1,'-o r')
hold on
plot(P2,'-* g')
hold on
plot(P3,'-< k')
hold on
plot(P4,'-> b')
hold on
plot(P5,'-^ y')
hold on
plot(P6,'-^ c')
xlabel('Samples/n')
ylabel('WEFDEα')
legend('P1','P2','P3','P4','P5','P6')
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',14);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',14);
set(gca,'FontName','Times New Roman','fontsize',14);%刻度的大小
openfig('ssd.fig');
openfig('vmd.fig');





