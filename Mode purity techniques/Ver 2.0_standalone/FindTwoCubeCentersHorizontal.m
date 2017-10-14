function [xCenters, yCenters, radius] = FindTwoCubeCentersHorizontal(cube)

Shim(mean(cube,3));
[y,x] = ginput(3);
x = round(x);
y = round(y);
close;
N = size(cube);
% this line is the only difference between horizontal and vertical cubes
radius = min([abs(1 - y(1))-1, abs(y(1) - y(2)), abs(y(2) - y(3)), abs(y(3) - N(2))-1]);

Idc1 = mean(cube(x(1) + (-radius:radius),y(1) + (-radius:radius),:),3);
Shim(Idc1, 1, 'chose center point and one end');
[xcm, ycm, ~] = FindDonutCenterAndRadius(Idc1);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);
[ycm, xcm] = ginput(1);
xcm1 = round(x(1) + xcm - radius);
ycm1 = round(y(1) + ycm - radius);
close;

Idc2 = mean(cube(x(3) + (-radius:radius),y(3) + (-radius:radius),:),3);
Shim(Idc2, 1,'chose center point only');
[xcm, ycm, ~] = FindDonutCenterAndRadius(Idc2);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);
[ycm, xcm] = ginput(1);
xcm2 = round(x(3) + xcm - radius);
ycm2 = round(y(3) + ycm - radius);
close

xCenters = [xcm1, xcm2];
yCenters = [ycm1, ycm2];
