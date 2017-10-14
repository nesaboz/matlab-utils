function [maxima, angle, p] = FindIntensityAroundRingDetailed(im, showCrosses)
% function [maxima, angle, p] = FindIntensityAroundRingDetailed(im, showCrosses (optional))
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
% This code finds arbitrary number of points, defined by theta, by finding 
% maximum along theta direction. It is slower but more detailed then fast
% 8-points algorithm.
%
% N.B. 2/8/2011
% N.B. 03/2011

N = size(im);
% 1) find the center of a LP02 mode
[xcm, ycm, radius] = FindDonutCenterAndRadius(im);

% 4) circle around and look for maxima in different directions
radius = 1.1*radius;
theta = 0:5:355;
M = length(theta);
p = zeros(M,2);
maxima = zeros(M,1);
h = waitbar(0,'Please wait...');
for i = 1:M
    waitbar(i/M,h);
    % take a line from the center to the edge
    
    xe = [xcm,  xcm - radius*sind(theta(i))];
    ye = [ycm,  ycm + radius*cosd(theta(i))];

    [CY,CX,C] = improfile(im, ye, xe);
    
    % find max 
    [m, b] = max(C);
    
    % store max
    p(i,1) = CX(b);
    p(i,2) = CY(b);
    maxima(i) = m;
end
close(h)

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
