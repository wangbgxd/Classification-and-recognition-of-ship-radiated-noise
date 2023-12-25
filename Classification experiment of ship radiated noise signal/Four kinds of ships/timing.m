clc
clear
close all

%%  
load Ship

figure
plot(Ferryboat);
xlim([0 2000])
set(gca,'FontSize',13)
xlabel('Sample points/n');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',16);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','fontsize',14);
figure
plot(Cargo_ship)
xlim([0 2000])
set(gca,'FontSize',13)
xlabel('Sample points/n');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',16);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','fontsize',14);
figure
plot(Cruise_ship)
xlim([0 2000])
set(gca,'FontSize',13)
xlabel('Sample points/n');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',16);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','fontsize',14);
figure
plot(Medium_sized_ships)
xlim([0 2000])
set(gca,'FontSize',13)
xlabel('Sample points/n');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',16);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','fontsize',14);
