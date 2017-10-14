function [maxima, angle, p] = FindIntensityAroundRingInstant(im, showCrosses, xcm, ycm, radius)
% [maxima, angle, p] = FindIntensityAroundRingInstant(im, radius)
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
% This code finds 8 points only, each at 45 degrees from the center, by
% finding maximum along that direction
%
% N.B. 2/8/2011

N = size(im);

% 1) find the center of a LP02 mode

% 2) find 4 max points: right, up, left and down 
maxima = zeros(9,1);
p = zeros(9,2);

% 4) find 4 points right, up, left and down 
% and find additional 4 points that are 45 degrees rotated
[maxima(1), I] = max(im(xcm, (ycm+1):N(2)));
p(1,:) = [xcm, ycm + I];
[maxima(3), I] = max(im(1:(xcm-1),ycm));
p(3,:) = [I, ycm];
[maxima(5), I] = max(im(xcm,1:ycm));
p(5,:) = [xcm, I];
[maxima(7), I] = max(im((xcm+1):N(1),ycm));
p(7,:) = [xcm + I, ycm];
d = round(radius/sqrt(2));
p(2,:) = [xcm - d, ycm + d];
p(4,:) = [xcm - d, ycm - d];
p(8,:) = [xcm + d, ycm + d];
p(6,:) = [xcm + d, ycm - d];
maxima([2,4,6,8]) = [im(p(2,1), p(2,2)), im(p(4,1), p(4,2)), im(p(6,1), p(6,2)), im(p(8,1), p(8,2))];

q = 1;
for i = 1:8
    temp = im(p(i,1)-q:p(i,1)+q, p(i,2)-q:p(i,2)+q);
    maxima(i) = mean(temp(:));
end

angle = (0:45:360)';

maxima(9) = maxima(1);
p(9,:) = p(1,:);

if showCrosses
    Shim(im);
    PutCross(xcm, ycm, [3 3], gcf, [0 1 0]);
    for i = 1:N
        PutCross(p(i,1), p(i,2), [3 3], gcf, [1 0 0]);
    end
end