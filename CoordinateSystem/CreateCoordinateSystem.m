function [X, Y, RADIUS, THETA] = CreateCoordinateSystem(M, xBegin, xEnd, yBegin, yEnd)
% function [X, Y, RADIUS, THETA] = CreateCoordinateSystem(M)
% M = new number of sampling points

if numel(M) == 1
    N(1) = M;
    N(2) = M;
    M = N;
end

x = linspace(xBegin, xEnd, M(1));
y = linspace(yBegin, yEnd, M(2));

[X, Y] = meshgrid(x,y);
Y = flipud(Y);  % makes 'y' coordinate as we are used to it, and you neeed to use quiver as:
% quiver(x,y, px,py) and not just quiver(px,py)

% the following line can be replaced with [THETA1, RADIUS1] = cart2pol(X,Y);
[RADIUS, THETA] = Cartesian2Polar(X,Y);



