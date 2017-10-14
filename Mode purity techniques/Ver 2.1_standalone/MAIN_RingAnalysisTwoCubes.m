% Ring technique
% N.B. 2012/8/4

%% 1) Load Stack
% pathname  ='C:\NENAD_DATA\ImagingData\2012_07_02';
% pathname  ='C:\NENAD_DATA\ImagingData\2012_08_24\Images\Ring\Ring_nikon_coh_control_OFF_1550.004nm_OVERNIGHT';
pathname  ='C:\NENAD_DATA\ImagingData\2012_03_27\dk11OD115\L1\trial1 QWP';

[stack, pathname1] = LoadStack(pathname,'tif',10);
if numel(stack) == 0
    return
    
   
else
    pathname = pathname1;
end
[cubeBG, meanValue, stDev] = ConvertStackToMatrix(stack);

%% 2) Wavelength or time sweep question
wavelengthOrTime = questdlg('Is this wavelength or time ?', ...
    'Wavelength or time question', ...
    'Wavelength', 'Time','Wavelength');
switch wavelengthOrTime,
    case 'Wavelength',
        [lambda, L] = FindWavelengths(stack);
    case 'Time',
        timing = GetTimeStamps(stack);
        timing = CorrectForMidnight(timing);
end


%% 3) Local background subtraction

N = size(cubeBG);
if numel(N) == 2
    N(3) = 1;
end
cube = cubeBG;
for i = 1:N(3)
    
    temp = cubeBG(1:10, 1:10,i);
    bgValue = mean(temp(:));
    cube(:,:,i) = cubeBG(:,:,i) - bgValue;
end

cube(cube<0) = eps*1e10;
disp('Done 3 - subtracted background')

%% 4) Crop cubes
keepCenters = questdlg('Keep centers?', ...
    'Keep centers', ...
    'Yes', 'No', 'Yes');
switch keepCenters,
    case 'Yes',
        
    case 'No',
        [xCenters, yCenters, delta, radius] = FindTwoCubeCentersHorizontal(cube);
end
[cube1, cube2, M] = ExtractTwoCubesHorizontal(cube, xCenters, yCenters, delta);
%% 5) Ring Method
answer = inputdlg('Correction coef.','Correction coef.',1,{'0.95'});
correctionCoeff = str2num(answer{1});
mode = questdlg('Mode?', ...
    'Mode', ...
    'OAM', 'LP01', 'OAM');
switch mode,
    case 'OAM',
        [MPI, junk1, profiles1, profiles2] = MPIRingMethod(cube1, cube2, radius, correctionCoeff,'OAM');
        PlotMPIOAM;
    case 'LP01',
        [MPI, junk1, profiles1, profiles2] = MPIRingMethod(cube1, cube2, radius, correctionCoeff,'LP01');
        PlotMPILP01;
end
disp(['Average value on the ring is ' num2str(max(mean(mean(profiles1)), mean(mean(profiles2))))]);

% %%
% ylim([-35 0])
% xlim([1547.5 1552.5])
% xlabel('\lambda (nm)')
% ylabel('MPI (dB)')
% PrepareGraphWithLegend
% title(' ' )
