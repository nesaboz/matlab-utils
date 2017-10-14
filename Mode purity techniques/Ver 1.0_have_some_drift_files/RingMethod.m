function [cube1, cube2] = RingMethod(cubePol1, cubePol2, scalingCoeff, showRing)

cube1.data = cubePol1;
cube2.data = cubePol2;

% find cube size
N = size(cube1.data);
if numel(N) == 2
    N(3) = 1;
end

% find Idc
cube1.Idc = mean(cubePol1,3);
cube2.Idc = mean(cubePol2,3);


if nargin < 4
    showRing = 0;
end
% find the ring points
[xcm, ycm, radius] = FindDonutCenterAndRadius(abs(cube1.Idc + cube2.Idc));
[junk, angles, ringPoints] = FindIntensityAroundRingDetailedR0Fixed(cube1.Idc + cube2.Idc, showRing, xcm, ycm, radius, 0:5:355);

if showRing 
    close;
end

% find modal amplitudes
cube1 = FindModeContributions(cube1, angles, ringPoints, scalingCoeff);
cube2 = FindModeContributions(cube2, angles, ringPoints, scalingCoeff);
