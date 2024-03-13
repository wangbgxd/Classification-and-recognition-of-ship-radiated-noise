
T=regular_statitic_features(s4')
% ssc1=SAM_ISSD1(s1',2000);
ssc2=SAM_ISSD1(s2',2000);
% ssc3=SAM_ISSD1(s3',2000);
ssc4=SAM_ISSD1(s4',2000);

a=ssc1(2,:);
b=ssc2(2,:);
c=ssc3(1,:);
d=ssc4(2,:);

max_mic_ship1=[1,0.4455];
max_mic_ship2=[1,0.2332];
max_mic_ship3=[1,0.3903];
max_mic_ship4=[1,0.2098];


%% 画图
for i=1:50                        % chen
p=a(randperm(length(a),1000));
RHFDE_R1(:,i)=RFEFDispEn(p',3,8,1);
% RHFDE_R1(:,i)=max_mic_ship1(1,2)*RHFDE_R1(:,i);
 end
 

 for i=1:50             % duffing
p=b(randperm(length(b),1000));

RHFDE_R2(:,i)=RFEFDispEn(p',3,8,1);

RHFDE_R2(:,i)=max_mic_ship2(1,2)*RHFDE_R2(:,i);

 end
 

 for i=1:50                       % logistic
p=c(randperm(length(c),1000))
RHFDE_R3(:,i)=RFEFDispEn(p',3,8,1);
RHFDE_R3(:,i)=max_mic_ship3(1,2)*RHFDE_R3(:,i);

 end
 

 for i=1:50                
p=d(randperm(length(d),1000));
RHFDE_R4(:,i)=RFEFDispEn(p',3,8,1);
RHFDE_R4(:,i)=max_mic_ship4(1,2)*RHFDE_R5(:,i);

 end

 
figure(1)
plot(RHFDE_R1,'-o r')
hold on
plot(RHFDE_R2,'-* g')
hold on
plot(RHFDE_R3,'-< k')
hold on
plot(RHFDE_R4,'-> b')

xlabel('Samples/n')
ylabel('WFHFDE')
legend('K1','K2','K3','K4')
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',14);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',14);
set(gca,'FontName','Times New Roman','fontsize',14);%刻度的大小


S1=zhongxing(725001:775000,1);
S2=duanchuan1(1:50000,1);
S3=youchuan(1:50000,1);
S4=huochuan(1:50000,1);

figure
subplot(4,1,1)
plot(S1)
set(gca,'FontSize',8);
title('K1');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',8);%横纵坐标名称的大小
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',8);
set(get(gca,'Title'),'FontName','Times New Roman','FontSize',8);
set(gca,'FontName','Times New Roman','fontsize',8);%刻度的大小
subplot(4,1,2)
plot(S2)
set(gca,'FontSize',12)
title('K2');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',8);%横纵坐标名称的大小
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',8);
set(get(gca,'Title'),'FontName','Times New Roman','FontSize',8);
set(gca,'FontName','Times New Roman','fontsize',8);%刻度的大小
subplot(4,1,3)
plot(S3)
set(gca,'FontSize',8)
title('K3');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',8);%横纵坐标名称的大小
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',8);
set(get(gca,'Title'),'FontName','Times New Roman','FontSize',8);
set(gca,'FontName','Times New Roman','fontsize',8);%刻度的大小
subplot(4,1,4)
plot(S4)
set(gca,'FontSize',8)
title('K3');xlabel('Sample points/n');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',10);%横纵坐标名称的大小
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',10);
set(get(gca,'Title'),'FontName','Times New Roman','FontSize',10);
set(gca,'FontName','Times New Roman','fontsize',8);%刻度的大小


