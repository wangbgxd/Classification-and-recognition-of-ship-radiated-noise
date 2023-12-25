clc
clear
close all

%%  
load Ship
% SSC_Ferryboat=RICSSD(Ferryboat,2000);
% SSC_Cargo_ship=RICSSD(Cargo_ship,2000);
% SSC_Cruise_ship=RICSSD(Cruise_ship,2000);
% SSC_Medium_sized_ships=RICSSD(Medium_sized_ships,2000);
load Decomposed_SSC_component


[f,b]=size(SSC_Cargo_ship)
IMFs = SSC_Cargo_ship;     
imf_len = length(IMFs);
n =f;
h1 = figure('NumberTitle','on','Name','gaussian分解结果');
set(h1,'position',[249,181,764,602]);
    for i = 1:n
        subplot(n,1,i);
        imf = IMFs(i,:);
        plot(imf, 'Color', [rand rand rand]);
        ylabel (['SSC' num2str(i)]);
        xlim([0 imf_len])
        if i < n                
            set(gca,'xtick',[])
        else                   
            xlabel('Sample points/n')
        end
        set(gca, 'box', 'off')
        set(gca,'FontName','Times New Roman','fontsize', 10);    
    end
        set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 10);

        
        [f,b]=size(SSC_Cruise_ship)
IMFs = SSC_Cruise_ship;     
imf_len = length(IMFs);
n =f;
 h1 = figure('NumberTitle','on','Name','gaussian分解结果');
	set(h1,'position',[249,181,764,602]);
    for i = 1:n
        subplot(n,1,i);
        imf = IMFs(i,:);
        plot(imf, 'Color', [rand rand rand]);
        ylabel (['SSC' num2str(i)]);
        xlim([0 imf_len])
        if i < n                
            set(gca,'xtick',[])
        else                   
            xlabel('Sample points/n')
        end
        set(gca, 'box', 'off')
        set(gca,'FontName','Times New Roman','fontsize', 10); 
    end
        set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 10);
        
        
        
[f,b]=size(SSC_Ferryboat)
IMFs = SSC_Ferryboat;     
imf_len = length(IMFs);
n =f;
 h1 = figure('NumberTitle','on','Name','gaussian分解结果');
	set(h1,'position',[249,181,764,602]);
    for i = 1:n
        subplot(n,1,i);
        imf = IMFs(i,:);
        plot(imf, 'Color', [rand rand rand]);
        ylabel (['SSC' num2str(i)]);
        xlim([0 imf_len])
        if i < n                
            set(gca,'xtick',[])
        else                   
            xlabel('Sample points/n')
        end
        set(gca, 'box', 'off') 
        set(gca,'FontName','Times New Roman','fontsize', 10);
    end
        set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 10);
        
        
        
[f,b]=size(SSC_Medium_sized_ships)
IMFs = SSC_Medium_sized_ships;     
imf_len = length(IMFs);
n =f;
 h1 = figure('NumberTitle','on','Name','gaussian分解结果');
	set(h1,'position',[249,181,764,602]);
    for i = 1:n
        subplot(n,1,i);
        imf = IMFs(i,:);
        plot(imf, 'Color', [rand rand rand]);
        ylabel (['SSC' num2str(i)]);
        xlim([0 imf_len])
        if i < n                
            set(gca,'xtick',[])
        else                   
            xlabel('Sample points/n')
        end
        set(gca, 'box', 'off')
        set(gca,'FontName','Times New Roman','fontsize', 10);     
    end
        set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 10);

 