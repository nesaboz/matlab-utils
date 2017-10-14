function array = PlotCenterLine(input, scale)
% function PlotFFTCenter(input)
if nargin < 2
     scale = 10;
end
%Pos(1)
N = size(input);
xc = round(N(1)/2) + 1;
yc = round(N(2)/2) + 1;
d = round(N(1)/scale);
%mesh(input( xc - d : xc + d, yc - d : yc + d));

% Shim(input( xc - d : xc + d, yc - d : yc + d));

array = input( xc - 0 : xc + 0 , yc - d + 1 : yc + d);
Pos(1);
plot(array);
% array = mean(array,1);