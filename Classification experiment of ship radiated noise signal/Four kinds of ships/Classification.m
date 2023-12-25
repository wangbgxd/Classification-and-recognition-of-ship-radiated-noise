clc
clear
close all
%%
load Decomposed_SSC_component

a=SSC_Ferryboat(1,:);
b=SSC_Cargo_ship(1,:);
c=SSC_Cruise_ship(3,:);
d=SSC_Medium_sized_ships(1,:);

max_chimic_SSC1=[1,0.4053];
max_chimic_SSC2=[1,0.5488];
max_chimic_SSC3=[3,0.1823];
max_chimic_SSC4=[1,0.5617];

%% 
for i=1:50                      
p=a(randperm(length(a),500));
S1(:,i)=EFFDispEn(p',3,8,1);
S1(:,i)=max_chimic_SSC1(1,2)*S1(:,i);
end
for i=1:50        
p=b(randperm(length(b),500));
S2(:,i)=EFFDispEn(p',3,8,1);
S2(:,i)=max_chimic_SSC2(1,2)*S2(:,i);
end
 for i=1:50                   
p=c(randperm(length(c),500));
S3(:,i)=EFFDispEn(p',3,8,1);
S3(:,i)=max_chimic_SSC3(1,2)*S3(:,i);
end
 for i=1:50             
p=d(randperm(length(d),500));
S4(:,i)=EFFDispEn(p',3,8,1);
S4(:,i)=max_chimic_SSC4(1,2)*S4(:,i);
 end
figure(1)
plot(S1,'-s')
hold on
plot(S2,'-p')
hold on
plot(S3,'->')
hold on
plot(S4,'-^')
xlabel('Samples/n')
ylabel('WEFDE')
legend('S1','S2','S3','S4')
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',14);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',14);
set(gca,'FontName','Times New Roman','fontsize',14);
openfig('FDE.fig');
openfig('EFDE.fig');
openfig('EFDEα.fig');
openfig('WEFDEα.fig');


