function [xCenters, yCenters, radius] = FindFourCubeCenters(cube)
N = size(cube);
xC = N(1)/2;
yC = N(2)/2;

Idc = mean(cube,3);
Idc1 = Idc(1:xC,1:yC);

Shim(Idc1, 1, 'chose center point and one end');
[xcm, ycm, ~] = FindDonutCenterAndRadius(Idc1);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);
[ycm, xcm] = ginput(1);
xcm1 = round(xcm);
ycm1 = round(ycm);

close;

Idc2 = Idc(xC+1:end,1:yC);
Shim(Idc2, 1,'chose center point only');
[xcm, ycm, ~] = FindDonutCenterAndRadius(Idc2);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);
[ycm, xcm] = ginput(1);
xcm2 = xC + round(xcm);
ycm2 = round(ycm);

close

Idc3 = Idc(1:xC,yC+1:end);
Shim(Idc3, 1,'chose center point only');
[xcm, ycm, ~] = FindDonutCenterAndRadius(Idc3);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);
[ycm, xcm] = ginput(1);
xcm3 = round(xcm);
ycm3 = yC + round(ycm);
close

Idc4 = Idc(xC+1:end,yC+1:end);
Shim(Idc4,1,'chose center point only');
[xcm, ycm, ~] = FindDonutCenterAndRadius(Idc4);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);

[ycm, xcm] = ginput(1);
xcm4 = xC + round(xcm);
ycm4 = yC + round(ycm);
close

xCenters = [xcm1, xcm2, xcm3, xcm4];
yCenters = [ycm1, ycm2, ycm3, ycm4];

radius = min([xcm1, ycm1, N(1)- xcm2 + 1, ycm2, xcm3, N(2) - ycm3 + 1, N(1)- xcm4 + 1, N(2) - ycm4 + 1]);
radius = radius - 1;
