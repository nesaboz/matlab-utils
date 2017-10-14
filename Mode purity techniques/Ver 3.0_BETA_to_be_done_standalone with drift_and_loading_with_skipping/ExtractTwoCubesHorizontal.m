function [cube1, cube2, M] = ExtractTwoCubesHorizontal(cube)
[xCenters, yCenters, radius] = FindTwoCubeCentersHorizontal(cube);

cube1 = cube(xCenters(1) + (-radius:radius), yCenters(1) + (-radius:radius), :);
cube2 = cube(xCenters(2) + (-radius:radius), yCenters(2) + (-radius:radius), :);

disp('Done 4 - extracted cubes');
M = size(cube1);