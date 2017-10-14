% Fit polynomial
% I wnat to fit x

clc;

xdata = lambdaArray';
ydata = real(neff);

[fresult, gof, output] = fit(xdata,ydata,'splineinterp');
%xdata1 = [850:2:1350]*10^-9;
Pos(1)
plot(xdata,fresult(xdata),'r:');%,xdata,ydata)
Pos(2)
plot(xdata(1:end-1),diff(fresult(xdata))./xdata(1:end-1),'r:','LineWidth',3);%,xdata(1:end-1),diff(ydata),'b')
fresult2 = diff( diff(fresult(xdata))./xdata(1:end-1) )./xdata(2:end-1);
Pos(3)
plot(xdata(2:end-1),fresult2,'r:','LineWidth',3);%,xdata(1:end-1),diff(ydata),'b')
