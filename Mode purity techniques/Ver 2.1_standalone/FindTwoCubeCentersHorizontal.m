function [xCenters, yCenters, delta, radius] = FindTwoCubeCentersHorizontal(cube)

Shim(mean(cube,3));
[y,x] = ginput(3);
x = round(x);
y = round(y);
close;
N = size(cube);
% this line is the only difference between horizontal and vertical cubes
delta = min([abs(1 - y(1))-1, abs(y(1) - y(2)), abs(y(2) - y(3)), abs(y(3) - N(2))-1]);

Idc1 = mean(cube(x(1) + (-delta:delta),y(1) + (-delta:delta),:),3);
Shim(Idc1, 1, 'chose center point and one end');
[xcm, ycm, radius1] = FindDonutCenterAndRadius(Idc1);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);

ButtonName = questdlg('Keep the center?', ...
    'Center', ...
    'Yes', 'No', 'Yes');
switch ButtonName,
    case 'Yes',
        disp('Keeping center');
    case 'No',
        [ycm, xcm] = ginput(1);
        [radiusTempY, radiusTempX] = ginput(1);
        radius1 = round(sqrt(abs(radiusTempX - xcm)^2 + abs(radiusTempY - ycm)^2));
end 

xcm1 = round(x(1) + xcm - delta);
ycm1 = round(y(1) + ycm - delta);
close;

Idc2 = mean(cube(x(3) + (-delta:delta),y(3) + (-delta:delta),:),3);
Shim(Idc2, 1,'chose center point only');
[xcm, ycm, radius2] = FindDonutCenterAndRadius(Idc2);
PutCross(ycm, xcm, [3 3] ,gcf, [0 1 0]);

ButtonName = questdlg('Keep the center?', ...
    'Center', ...
    'Yes', 'No', 'Yes');
switch ButtonName,
    case 'Yes',
        disp('Keeping center');
    case 'No',
        [ycm, xcm] = ginput(1);
        [radiusTempY, radiusTempX] = ginput(1);
        radius2 = round(sqrt(abs(radiusTempX - xcm)^2 + abs(radiusTempY - ycm)^2));
end 

xcm2 = round(x(3) + xcm - delta);
ycm2 = round(y(3) + ycm - delta);
close

xCenters = [xcm1, xcm2];
yCenters = [ycm1, ycm2];
radii = [radius1, radius2];
radius = round(mean(radii));
