%% Load stack
pathname = 'C:\ImagingData\2012_01_02';
stack = LoadStack(pathname);
cube = ConvertStackToMatrix(stack);
N = size(cube);
%% remove background
bgTemp = LoadImage('C:\ImagingData\2012_01_02\background_13000.tif');
bg = mean(bg(:)).*ones(N(1),N(2));
bgCube = repmat(bg,[1, 1, N(3)]);
cube = cube - bgCube; 
cube(cube<0) = eps*1e10;
