function [xCenters, yCenters, radius] = FindTwoCubeCenters(cube)
N = size(cube);
xC = N(1)/2;
Idc = mean(cube,3);

Idc1 = Idc(1:xC,:);

Shim(Idc1, 1, 'chose center point and one end');
[xcm, ycm, ~] = FindDonutCenterAndRadius(Idc1);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);
[ycm, xcm] = ginput(1);
xcm1 = round(xcm);
ycm1 = round(ycm);
close;

Idc2 = Idc(xC+1:end,:);
Shim(Idc2, 1,'chose center point only');
[xcm, ycm, ~] = FindDonutCenterAndRadius(Idc2);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);
[ycm, xcm] = ginput(1);
xcm2 = xC + round(xcm);
ycm2 = round(ycm);
close

xCenters = [xcm1, xcm2];
yCenters = [ycm1, ycm2];

radius = min([xcm1, ycm1, N(1)- xcm2 + 1, ycm2]); 
radius = radius - 1;
