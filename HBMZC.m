clc
clear all
ZB = readtable('Dataset1.xlsx');
x=ZB{:,1};
y=ZB{:,2};
ZB=table2array(ZB);
%% Obtaining the quasi-MZC center through Bayesian Linear Regression
[xb,yb,zb,vls]=BYS(x,y);
%% Obtaining the MZC center and calculating the MZC roundness error
[Om,f]=MZC(x,y,xb,yb,zb,vls)
%%
close all
figure,
plot(Om(1),Om(2),'r.')

hold on
[Rmax,indMax]=max(sqrt(sum(((ZB-Om).^2)')));
viscircles(Om, Rmax,'Color','b');hold on,plot(x(indMax),y(indMax),'ro')
hold on
[Rmin,indMin]=min(sqrt(sum(((ZB-Om).^2)')));
viscircles(Om, Rmin,'Color','b');hold on,plot(x(indMin),y(indMin),'ro')
hold on,plot(x,y,'r.')