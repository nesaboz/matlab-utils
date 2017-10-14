%% TEST MPI and error MPI
clc
close all
N = 1000;
a0 = linspace(16,100,N);
b0 = 10*ones(1,N);
c0 = 1*ones(1,N);
a1 = zeros(1,N);
b1 = zeros(1,N);
c1 = zeros(1,N);
a2 = zeros(1,N);
b2 = zeros(1,N);
c2 = zeros(1,N);


for i = 1:N
   
%     b0(i) = 10;
%     c0(i) = 1;
%     a0(i) = 10^(i/100)*(b0(i) + c0(i));    
    
    x = 0:5:355;
    DC = a0(i)^2 + b0(i)^2 + c0(i)^2;
    delta1 = 2*a0(i)*c0(i);
    delta2 = 2*a0(i)*b0(i);
    
    y =  DC + delta1*cosd(x+120.2457) + delta2*cosd(2*x + 35.6575);
    y(y<0) = eps;
    scaleValue = 3000/max(y);
    y = y*scaleValue;
    
    a0(i) = a0(i)*sqrt(scaleValue);
    b0(i) = b0(i)*sqrt(scaleValue);
    c0(i) = c0(i)*sqrt(scaleValue);
    DC = a0(i)^2 + b0(i)^2 + c0(i)^2;
    delta1 = 2*a0(i)*c0(i);
    delta2 = 2*a0(i)*b0(i);
       
    % y = y + 2*sqrt(y).*(rand(1,size(x,2)) - 0.5);
        
    [coeff, ringIntensityNew] = FourierSeriesForDegrees(x, y, 4);
    [a1(i), b1(i), c1(i)] = FindABCFromRingIntensity(x, y);
        
    % plot(y)
    % pause
    %[a1(i),b1(i),c1(i)] = FindABC(DC, delta1, delta2);
    [a2(i),b2(i)] = FindAB(DC, delta2);
    [~,~,c2(i)] = FindABC(DC, delta1, delta2);
end

MPI = 10*log10((b1.^2 + c1.^2) ./ (a1.^2 + b1.^2 + c1.^2));
errorMPIa1 = 20*log10(a0./a1);
errorMPIb1 = 20*log10(b0./b1);
errorMPIc1 = 20*log10(c0./c1);
errorMPIa2 = 20*log10(a0./a2);
errorMPIb2 = 20*log10(b0./b2);
errorMPIc2 = 20*log10(c0./c2);

Pos(1)
plot(MPI, errorMPIa1, MPI, errorMPIa2,'r')
xlabel('MPI (dB)');
ylabel('Error in MPI (dB)');
title('mode a')
legend('ABC','AB')
Pos(2)
plot(MPI, errorMPIb1, MPI, errorMPIb2,'r')
xlabel('MPI (dB)');
ylabel('Error in MPI (dB)');
title('mode b')
legend('ABC','AB')
Pos(3)
plot(MPI, errorMPIc1, MPI, errorMPIc2,'r')
xlabel('MPI (dB)');
ylabel('Error in MPI (dB)');
title('mode c')
legend('ABC','AB')







