function [cube1, cube2, M] = ExtractTwoCubesHorizontalWithDrift1(cube)

% distance between centers = 134;
dbc = 134;

N = size(cube);
[xCentersBegin, yCentersBegin, radius] = FindTwoCubeCentersHorizontal(cube);

h = waitbar(0,'Please wait...');

xCenters = zeros(N(3),2);
yCenters = zeros(N(3),2);
radiusC = zeros(N(3),2);

for i = 3:N(3)-2
    waitbar(i/N(3),h)
    
    [xCenters(i,1), yCenters(i,1), radiusC(i,1)] = ...
        FindDonutCenterAndRadius(mean(cube(xCentersBegin(1) + (-radius:radius),...
                                           yCentersBegin(1) + (-radius:radius), i-2:i+2),3));
    [xCenters(i,2), yCenters(i,2), radiusC(i,2)] = ...
        FindDonutCenterAndRadius(mean(cube(xCentersBegin(2) + (-radius:radius),...
                                           yCentersBegin(2) + (-radius:radius), i-2:i+2),3));
      
    if i == 3
        xCenters(1,1) = xCenters(3,1);
        xCenters(2,1) = xCenters(3,1);
        xCenters(1,2) = xCenters(3,2);
        xCenters(2,2) = xCenters(3,2);
        yCenters(1,1) = yCenters(3,1);
        yCenters(2,1) = yCenters(3,1);
        yCenters(1,2) = yCenters(3,2);
        yCenters(2,2) = yCenters(3,2);
    end
    
    if i == N(3) - 2
        xCenters(N(3),1) = xCenters(N(3)-2,1);
        xCenters(N(3)-1,1) = xCenters(N(3)-2,1);
        xCenters(N(3),2) = xCenters(N(3)-2,2);
        xCenters(N(3)-1,2) = xCenters(N(3)-2,2);
        yCenters(N(3),1) = yCenters(N(3)-2,1);
        yCenters(N(3)-1,1) = yCenters(N(3)-2,1);
        yCenters(N(3),2) = yCenters(N(3)-2,2);
        yCenters(N(3)-1,2) = yCenters(N(3)-2,2);
    end
    
end
close(h)

[xCenters, yCenters] = CorrectForAnomalies(xCenters, yCenters);
cube1 = zeros(2*radius + 1, 2*radius + 1, N(3));
cube2 = zeros(2*radius + 1, 2*radius + 1, N(3));
for i = 1:N(3)
    cube1(:,:,i) = cube(xCentersBegin(1) - radius + xCenters(i,1) + (-radius:radius), ...
        yCentersBegin(1) - radius + yCenters(i,1) + (-radius:radius), i);
    cube2(:,:,i) = cube(xCentersBegin(2) - radius + xCenters(i,2) + (-radius:radius), ...
        yCentersBegin(2) - radius + yCenters(i,2) + (-radius:radius), i);
end


disp('Done 4 - extracted cubes');
M = size(cube1);