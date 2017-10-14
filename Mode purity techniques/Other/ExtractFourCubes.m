function [cubePol1, cubePol2, cubePol3, cubePol4, M] = ExtractFourCubes(cube)
[xCenters, yCenters, radius] = FindFourCubeCenters(cube);

cubePol1 = cube(xCenters(1) + (-radius:radius), yCenters(1) + (-radius:radius), :);
cubePol2 = cube(xCenters(2) + (-radius:radius), yCenters(2) + (-radius:radius), :);
cubePol3 = cube(xCenters(3) + (-radius:radius), yCenters(3) + (-radius:radius), :);
cubePol4 = cube(xCenters(4) + (-radius:radius), yCenters(4) + (-radius:radius), :);

disp('Done 4 - extracted cubes');
M = size(cubePol1);

% Shim(cubePol1(:,:,1), 1, 'First image of a new cubePol1');
% Shim(cubePol2(:,:,1), 2, 'First image of a new cubePol2');
% Shim(cubePol3(:,:,1), 3, 'First image of a new cubePol3' );
% Shim(cubePol4(:,:,1), 4, 'First image of a new cubePol4' );