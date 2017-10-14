clc;
close all

% its simple 
f = fittype('a*x^3 + b*x^2 + c*x + d');

s = fitoptions('Method','None',...
               'Lower',[1000, 0,    0,   0,    0],...
               'Upper',[2000, 1000, 360, 1000, 360]);

[FO,gof,output] = fit(x, y, f);

%% another way is interpolation
% exposureTime = (330:20:99999)';
% meanValue = interp1(exposureTimeFit, meanValueFit, exposureTime, 'cubicspline');
% 
% plot(exposureTimeFit, meanValueFit)
% hold on; 
% plot(exposureTime, meanValue,'r');
% hold off
% 
% %%
% X = [exposureTime, meanValue];
% dlmwrite('zika.txt',X)
% 
