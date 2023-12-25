clc
clear
close all

%%  
load Measured_marine_organism_signal
figure(1)
plot(Seabird);
xlim([0 2000])
set(gca,'FontSize',13)
xlabel('Sample points/n');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',16);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','fontsize',14);
figure
plot(Sea_lion)
xlim([0 2000])
set(gca,'FontSize',13)
xlabel('Sample points/n');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',16);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','fontsize',14);
figure
plot(Sperm_whale)
xlim([0 2000])
set(gca,'FontSize',13)
xlabel('Sample points/n');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',16);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','fontsize',14);
figure
plot(Chinese_white_dolphin)
xlim([0 2000])
set(gca,'FontSize',13)
xlabel('Sample points/n');ylabel('Amplitude/V');
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',16);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','fontsize',14);
