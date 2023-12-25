clc
clear
close all

load Measured_marine_organism_signal
load Decomposed_SSC_component

% %%  ChiMic
% y=Seabird;
% [r,c]=size(SSC_Seabird);
% for i=1:r
% MIC=ChiMIC([y,SSC_Seabird(i,:)'],2000^0.6,15,2000);
% MIC1(1,i)=MIC
% end
% y=Sperm_whale;
% [r,c]=size(SSC_Sperm_whale);
% for i=1:r
%  MIC=ChiMIC([y,SSC_Sperm_whale(i,:)'],2000^0.6,15,2000);
% MIC2(1,i)=MIC
% end
% y=Chinese_white_dolphin;
% [r,c]=size(SSC_Chinese_white_dolphin);
% for i=1:r
%  MIC=ChiMIC([y,SSC_Chinese_white_dolphin(i,:)'],2000^0.6,15,2000);
% MIC5(1,i)=MIC
% end
% y=Sea_lion;
% [r,c]=size(SSC_Sea_lion);
% for i=1:r
%  MIC=ChiMIC([y,SSC_Sea_lion(i,:)'],2000^0.6,15,2000);
% MIC5(1,i)=MIC
% end


load Seabird_chimic
load Sea_lion_chimic
load Sperm_whale_chimic
load Chinese_white_dolphin_chimic