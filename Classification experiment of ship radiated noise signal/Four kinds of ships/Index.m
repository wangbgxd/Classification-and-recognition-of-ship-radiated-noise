clc
clear
close all

load WEFDEα

m1(1,1)=mean(S1);
m1(1,2)=mean(S2);
m1(1,3)=mean(S3);
m1(1,4)=mean(S4);

MMD(1)=m1(1,1)-m1(1,2);
MMD(2)=m1(1,1)-m1(1,3);
MMD(3)=m1(1,1)-m1(1,4);
MMD(4)=m1(1,2)-m1(1,3);
MMD(5)=m1(1,2)-m1(1,4);
MMD(6)=m1(1,3)-m1(1,4);
mmd=min(MMD);

s1(1,1)=std(S1);
s1(1,2)=std(S2);
s1(1,3)=std(S3);
s1(1,4)=std(S4);
  
cv(1,1)=s1(1,1)/m1(1,1);
cv(1,2)=s1(1,2)/m1(1,2);
cv(1,3)=s1(1,3)/m1(1,3);
cv(1,4)=s1(1,4)/m1(1,4);