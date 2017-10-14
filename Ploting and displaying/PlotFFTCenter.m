function array = PlotFFTCenter(input, scale)
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
% array = mean(array,1);
%plot(array,'LineWidth',3);
%axis([-30 30 -1*10^8 8*10^8])
%axis([0 200 -1*10^8 18*10^8])