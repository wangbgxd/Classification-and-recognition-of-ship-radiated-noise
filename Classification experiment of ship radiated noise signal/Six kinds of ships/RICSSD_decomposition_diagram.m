clc
clear
close all

%%  
% SSC_ship1=RICSSD(ship1,2000);
% SSC_ship2=RICSSD(ship2,2000);
% SSC_ship3=RICSSD(ship3,2000);
% SSC_ship4=RICSSD(ship4,2000);
% SSC_ship5=RICSSD(ship5,2000);
% SSC_ship6=RICSSD(ship6,2000);
load SSC_ship1
load SSC_ship2
load SSC_ship3
load SSC_ship4
load SSC_ship5
load SSC_ship6
[f,b]=size(SSC_ship1)
IMFs = SSC_ship1;     
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

        
        [f,b]=size(SSC_ship2)
IMFs = SSC_ship2;     
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
        
        
        
        [f,b]=size(SSC_ship3)
IMFs = SSC_ship3;     
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
        
        
        
        [f,b]=size(SSC_ship4)
IMFs = SSC_ship4;     
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

        [f,b]=size(SSC_ship5)
IMFs = SSC_ship5;     
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

[f,b]=size(SSC_ship6)
IMFs = SSC_ship6;     
imf_len = length(IMFs);
n=f;
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

