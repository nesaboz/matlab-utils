function [cube1, cube2, M] = ExtractTwoCubesHorizontal(cube, xCenters, yCenters, delta)

cube1 = cube(xCenters(1) + (-delta:delta), yCenters(1) + (-delta:delta), :);
cube2 = cube(xCenters(2) + (-delta:delta), yCenters(2) + (-delta:delta), :);

disp('Done 4 - extracted cubes');
M = size(cube1);