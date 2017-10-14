% TEST Fourier series 
close all
x = 0:5:355;
y = 2.56 + 2*sind(x + 183);
[B, yNew] = FourierSeriesForDegrees(x,y,2);
B
plot(x,y)
hold on
plot(x,yNew,'r')