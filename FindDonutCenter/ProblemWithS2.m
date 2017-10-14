clc;
close all;
M = 10000;
% t = linspace(0,4.1*pi - 4*pi/M,M);
t = linspace(0,40*pi,M);
temp = zeros(1,20);
temp1 = zeros(1,20);
temp2 = zeros(1,20);
for k = 1:20
    y = 5 + 3*sin(10*t) ;
    % y = 5 +  3*sin(1*t + k);
    ma = max(y);
    mi = min(y);
    V = (ma - mi)/(ma + mi);
    ratio = (1 + sqrt(1-V^2)) ./ V;
    % powerRatioDb = 20*log10(ratio);

    a = [(max(y) - min(y))/2, mean(y)];
    b = [sqrt(a(1) + a(2)), sqrt(abs(a(1) - a(2)))];
    temp1(k) = mean(b) / (abs(b(1) - b(2))/2) /2;
    temp1(k) = ratio/2;
    ftY = abs(fft(y));
    temp(k) = ftY(1)/ftY(22)/2;
    temp2(k) = ftY(1)/ftY(7)/2;
    
    % temp(k) = sum(ftY(10:30));
%     Pos(1); plot(y);
%     axis([0 M 0 10])
%     Pos(2); plot(ftY(1:100))
% pause
end
Pos(3)
plot(temp);
title(num2str(mean(temp)));
Pos(4);
plot(temp1);
title(num2str(mean(temp1)));
Pos(1);
plot(temp2);
title(num2str(mean(temp2)));

Pos(1); 
plot(y);
axis([0 M 0 10])
Pos(2); 
plot(ftY(1:M))