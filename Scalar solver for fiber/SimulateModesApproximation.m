function [HE11, HE21, TE] = SimulateModesApproximation
% function [HE11, HE21, TE] = SimulateModesApproximation
%
% Approximation of modes with bessel functions

N = 300;
t1 = 0.03*(((-N/2):(N/2)-1) + 1/2);
[x,y] = meshgrid(t1,t1);
% y = flipud(y); % makes 'y' coordinate as we are used to it, but this is
% not good for quiver f-on

[radius, phi] = Cartesian2Polar(x,y);

J0 = besselj(0,radius);
J1 = besselj(1,radius);
J0 = J0/max(J0(:));

J1 = 1/1.353*J1/max(J1(:));  %1/1.353 = 0.739 is the ratio of HE21 and HE11 maxima, obtained from SimulationModePurity

% % plot modes
% plot(J0(N/2 + 1,:));
% hold on 
% plot(J1(N/2 + 1,:), 'r')
% 
% temp = J0.*J1;
% plot(temp(N/2 + 1,:), 'g')
% hold off

HE11.x = J0;
HE11.y = 0;

HE21.x = J1.*cos(phi);
HE21.y = -J1.*sin(phi);

TE.x = J1.*sin(phi);
TE.y = -J1.*cos(phi);