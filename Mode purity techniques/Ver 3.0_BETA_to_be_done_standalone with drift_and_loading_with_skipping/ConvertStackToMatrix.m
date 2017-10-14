function [matrixCube, meanValue, stDev] = ConvertStackToMatrix(cube)
% function matrixCube = ConvertStackToMatrix(cube)
N = [size(cube(1).data) - [2,0], numel(cube)];
matrixCube = zeros(N);
meanValue = zeros(N(3),1);
stDev = zeros(N(3),1);
h = waitbar(0,'Please wait...');
for i = 1:N(3)
    waitbar(i/N(3),h)
    matrixCube(:,:,i) = cube(i).data(2:end-1,:); % correction for first and last row
    temp = matrixCube(:,:,i);
    meanValue(i) = mean(temp(:));
    stDev(i) = std(temp(:));
end
close(h)