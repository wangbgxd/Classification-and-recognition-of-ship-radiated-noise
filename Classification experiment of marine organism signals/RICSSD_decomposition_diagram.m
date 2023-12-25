clc
clear
close all

%%  
load Measured_marine_organism_signal
% SSC_Seabird=RICSSD(Seabird,2000);
% SSC_Sea_lion=RICSSD(Sea_lion,2000);
% SSC_Sperm_whale=RICSSD(Sperm_whale,2000);
% SSC_Chinese_white_dolphin=RICSSD(Chinese_white_dolphin,2000);

load Decomposed_SSC_component


[f,b]=size(SSC_Seabird)
IMFs = SSC_Seabird;     
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

        
        [f,b]=size(SSC_Sea_lion)
IMFs = SSC_Sea_lion;     
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
        
        
        
        [f,b]=size(SSC_Sperm_whale)
IMFs = SSC_Sperm_whale;     
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
        
        
        
        [f,b]=size(SSC_Chinese_white_dolphin)
IMFs = SSC_Chinese_white_dolphin;     
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

