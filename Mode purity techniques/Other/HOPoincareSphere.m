cube3.Idc = mean(cubePol3,3);
cube4.Idc = mean(cubePol4,3);

cube1.data = cubePol1;
cube1.Idc = mean(cube1.data,3);

% % find the ring points 
[xcm, ycm, radius] = FindDonutCenterAndRadius(abs(cube3.Idc + cube4.Idc));
[~, angles, p] = FindIntensityAroundRingDetailedR0Fixed(cube3.Idc + cube4.Idc, 0, xcm, ycm, radius, 0:1:359);
close;

% % find the ring points for cube1
[~,~,~, cube1.profiles] = FindCubeProfilesAndABC(cube1.data, angles, p);
[~, ~, ~] = FindIntensityAroundRingDetailedR0Fixed(cube1.Idc, 0, xcm, ycm, radius, 0:1:359);
close;
%%
close all
i1 = 1;
i2 = size(cube1.profiles,1);
i1 = 200;
i2 = 275;
Pos(1)
plot(cube1.profiles(i1:i2,:)')
%%
Pos(2)
k = 0;
bigGamma = zeros(1,i2-i1+1);
for i = i1:i2
    x = 0:1:359;
    [~, yNew1] = FourierSeriesForDegrees(x,cube1.profiles(i,:), 2);
    [~, yNew2] = FourierSeriesForDegrees(x,cube1.profiles(i,:), 1);
    yNew = yNew1 - yNew2;
    % yNew = cube1.profiles(i,:);
    plot(x,yNew);
    pause(0.1)
    [~, maxIndex] = max(yNew(120:300));
    k = k + 1;
    bigGamma(k) = (maxIndex);
end
plot(bigGamma)

%%
Pos(2)

%%
a1New = sqrt(10.^(MPI.a1(i1:i2)./10)); 
a2New = sqrt(10.^(MPI.a2(i1:i2)./10)); 

% a1New = [1,0]';
% a2New = [0,1]';
% bigGamma = [12, 65];

% but this is vortex, we need HE21 coefficients
% a1N = (a1New + a2New) / sqrt(2);
% a2N = (a1New - a2New) / sqrt(2);
% 
% a1New = a1N;
% a2New = a2N;

S0 = a1New.^2 + a2New.^2;
S3 = a1New.^2 - a2New.^2;
S2 = 2*a1New.*a2New.*cosd((bigGamma - bigGamma(1))');
S1 = 2*a1New.*a2New.*sind((bigGamma - bigGamma(1))');
Pos(1)
SphereTemplate;
stokesParameters = [S0, S1, S2, S3]';
AddPolarimetryData(stokesParameters);
title('HOM Poincare Sphere','FontSize',24);

