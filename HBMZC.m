clc
clear all
ZB = readtable('Dataset1.xlsx');
x=ZB{:,1};
y=ZB{:,2};
%% Obtaining the quasi-MZC center through Bayesian Linear Regression
[xb,yb,zb,vls]=BYS(x,y);
%% Obtaining the MZC center and calculating the MZC roundness error
[Oq,cp,Om,f]=MZC(x,y,xb,yb,zb,vls); 