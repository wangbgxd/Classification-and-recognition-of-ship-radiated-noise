clc
clear
close all

load Six kinds of ship signals
load SSC_ship1
load SSC_ship2
load SSC_ship3
load SSC_ship4
load SSC_ship5
load SSC_ship6
%% ChiMic
% y=ship1;
% [r,c]=size(SSC_ship1);
% for i=1:r
% MIC=ChiMIC([ship1,SSC_ship1(i,:)'],2000^0.6,15,2000);
% MIC1(1,i)=MIC
% end
% 
% y=ship2;
% [r,c]=size(SSC_ship2);
% for i=1:r
%  MIC=ChiMIC([ship2,SSC_ship2(i,:)'],2000^0.6,15,2000);
% MIC2(1,i)=MIC
% end
% 
% y=ship3;
% [r,c]=size(SSC_ship3);
% for i=1:r
%  MIC=ChiMIC([ship3,SSC_ship3(i,:)'],2000^0.6,15,2000);
% MIC3(1,i)=MIC
% end
% 
% y=ship4;
% [r,c]=size(SSC_ship4);
% for i=1:r
%  MIC=ChiMIC([ship4,SSC_ship4(i,:)'],2000^0.6,15,2000);
% MIC4(1,i)=MIC
% end
% 
% y=ship5;
% [r,c]=size(SSC_ship5);
% for i=1:r
%  MIC=ChiMIC([ship5,SSC_ship5(i,:)'],2000^0.6,15,2000);
% MIC5(1,i)=MIC
% end
% 
% y=ship6;
% [r,c]=size(SSC_ship6);
% for i=1:r
%  MIC=ChiMIC([ship6,SSC_ship6(i,:)'],2000^0.6,15,2000);
% MIC6(1,i)=MIC
% end

load CHIMIC value after decomposition