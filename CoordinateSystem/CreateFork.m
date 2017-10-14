clc;
close all
M = 300;
x0 = 10;
[X, Y, RADIUS, THETA] = CreateCoordinateSystem(M, -x0, x0, -x0, x0);
%Shim(1/2*(mod(1*THETA + 5*X,2*pi) + mod(-1*THETA - 5*(X-0.5),2*pi) - 2.5)) ;
Shim(1/2*(mod(-1*THETA - 5*X,2*pi)))

