function [maxima, angle, p] = FindIntensityAroundRingDetailedR0(im, showCrosses)
% [maxima, angle, p] = FindIntensityAroundRingDetailedR0(im, showCrosses)
% 
% This code helps with determining HE21 mode purity since HE21 even
% and odd modes interfere with TE, TM and unconverted HE11 modes.
% Maxima vs angle is the distibution, with p having the (x,y) coordinates
% stored columnwise (note that x and y are compatible with matrix-convention,
% i.e. im(x,y) is the true value not im(y,x).
%
% From the interference pattern one can determinte the power in each of
% those modes. 
%
% For now, we look at the intensity around the ring, not a
% perfect solution but seems to be working.
%
% This code finds arbitrary number of points, defined by theta, by first 
% finding the R0, i.e. the radius where HE11r*HE21r is maximum, then taking values from that R0.  
% It is slower but more detailed then fast
% 8-points algorithm.
%
% N.B. 2/8/2011


% this part is taken from FindIntensityAroundRing in order to find LP02
% center
N = size(im);

% 1) find the center of a LP02 mode
[xcm, ycm, radius] = FindDonutCenterAndRadius(im);
if radius > 100;
    return;
end

    % 4) circle around and look for maxima in different directions
theta = 0:5:355;
M = length(theta);
p = zeros(M,2);
maxima = zeros(M,1);
for i = 1:M
    % take a line from the center to the edge
    
    p(i,1) = round(xcm - radius*sind(theta(i)));
    p(i,2) = round(ycm + radius*cosd(theta(i)));
    
    p(i,1) = min(256, p(i,1));
    p(i,1) = max(1, p(i,1));
    p(i,2) = min(320, p(i,2));
    p(i,2) = max(1, p(i,2));
       
    maxima(i) = im(p(i,1), p(i,2));
end

angle = theta';

if nargin < 2 
    showCrosses = 0;
end

if showCrosses
    Shim(im);
    PutCross(xcm, ycm, 3 ,gcf, [0 1 0]);
    for i = 1:M
        PutCross(p(i,1), p(i,2), 3 ,gcf, [1 0 0]);
    end
end
