function [matrixCube, meanValue, stDev] = ConvertStackToMatrix(stack)
% function matrixCube = ConvertStackToMatrix(cube)
N = [size(stack(1).data), numel(stack)];
matrixCube = zeros(N);
meanValue = zeros(N(3),1);
stDev = zeros(N(3),1);
h = waitbar(0,'Please wait...');
for i = 1:N(3)
    waitbar(i/N(3),h)
    matrixCube(:,:,i) = stack(i).data;
    temp = matrixCube(:,:,i);
    meanValue(i) = mean(temp(:));
    stDev(i) = std(temp(:));
end
close(h)