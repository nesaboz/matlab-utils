function [radius, theta] = Cartesian2Polar(x,y)
% Convers x and y obtained by mashgrid into radius and theta
theta1 = atan(y./x).*((x>=0).*(y>0));
theta2 = (atan(y./x) + pi).*((x<0).*(y>=0));
theta3 = (atan(y./x) + pi).*((x<0).*(y<0));
theta4 = (atan(y./x)+ 2*pi).*((x>=0).*(y<0));
theta = theta1 + theta2 + theta3 + theta4;
radius = sqrt(x.^2 + y.^2);
theta(isnan(theta)) = 0;

% theta = flipud(theta);