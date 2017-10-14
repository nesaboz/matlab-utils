% S^2 analysis
stack = LoadStack('C:\NENAD_DATA\ImagingData\2011_05_30\L5\L5_HE21odd');
if numel(stack) == 0
    return
end

[cubeBG, meanValue, stDev] = ConvertStackToMatrix(stack);

% 2) find wavelengths
[lambda, L] = FindWavelengths(stack);
% 3) subtract background
cube = SubtractBG(cubeBG, stack(1).name);
% 4) crop cubes
[cubePol1, cubePol2, cubePol3, cubePol4, M] = ExtractAndCropCubes(cube);

[Idc1, Idc2, Idc3, Idc4] = FindIdc(cubePol1, cubePol2, cubePol3, cubePol4);

clear cubeBG cube

% 5) FFTcubes
[fftCubePol1, fftCubePol2, fftCubePol3, fftCubePol4] = FindFFTCubes(cubePol1, cubePol2, cubePol3, cubePol4);
