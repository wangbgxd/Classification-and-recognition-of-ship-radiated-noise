clc
clear
close all

load Ship
load Decomposed_SSC_component
%% ChiMic
% y=Cargo_ship;
% [r,c]=size(SSC_Cargo_ship);
% for i=1:r
% MIC=ChiMIC([y,SSC_Cargo_ship(i,:)'],2000^0.6,15,2000);
% MIC1(1,i)=MIC
% end
% % 
% y=Cruise_ship;
% [r,c]=size(SSC_Cruise_ship);
% for i=1:r
%  MIC=ChiMIC([y,SSC_Cruise_ship(i,:)'],2000^0.6,15,2000);
% MIC2(1,i)=MIC
% end
% 
% y=Ferryboat;
% [r,c]=size(SSC_Ferryboat);
% for i=1:r
%  MIC=ChiMIC([y,SSC_Ferryboat(i,:)'],2000^0.6,15,2000);
% MIC3(1,i)=MIC
% end
% 
% y=Medium_sized_ships;
% [r,c]=size(SSC_Medium_sized_ships);
% for i=1:r
%  MIC=ChiMIC([Medium_sized_ships,SSC_Medium_sized_ships(i,:)'],2000^0.6,15,2000);
% MIC4(1,i)=MIC
% end
% 

load chimic_Cargo_ship
load chimic_Cruise_ship
load chimic_Ferryboat
load chimic_Medium_sized_ships