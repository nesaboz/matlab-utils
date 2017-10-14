% Ring technique
% N.B. 2012/8/4

%% 1) Load Stack
% pathname  ='C:\NENAD_DATA\ImagingData\2012_07_02';

pathname  = 'C:\NENAD_DATA\ImagingData\2012_08_24\Images\Ring\Ring_nikon_coh_control_OFF_1550.004nm_OVERNIGHT';
% pathname  ='C:\Users\Nenad\Dropbox\work\Ver 2.2_standalone\Lu';
%%
% [stack, pathname] = LoadStack(pathname,'tif',10);
% [stack, pathname] = LoadStackFromTo(pathname, 'tif', 1478, 685, 1);
[stack, pathname] = LoadStackFromTo(pathname, 'tif', 1, 600, 1);
if numel(stack) == 0
    return
end
[cubeBG, meanValue, stDev] = ConvertStackToMatrix(stack);
% cubeBG = cubeBG + 2^15;
%% 2) Wavelength or time sweep question
wavelengthOrTime = questdlg('Is this wavelength, time or something else?', ...
    'Wavelength or time question', ...
    'Wavelength', 'Time', 'Something else', 'Wavelength');
switch wavelengthOrTime,
    case 'Wavelength',
        [lambda, L] = FindWavelengths(stack);
    case 'Time',
        timing = GetTimeStamps(stack);
        timing = CorrectForMidnight(timing);
    case 'Something else',
        % timing = GetTimeStamps(stack);
        % timing = CorrectForMidnight(timing);
end


%% 3) Local background subtraction

% N = size(cubeBG);
% if numel(N) == 2
%     N(3) = 1;
% end
% cube = cubeBG;
% for i = 1:N(3)
%     
%     temp = cubeBG(1:10, (end-10):end,i);
%     bgValue = mean(temp(:));
%     cube(:,:,i) = cubeBG(:,:,i) - bgValue;
% end
% 
% cube(cube<0) = eps*1e10;
% disp('Done 3 - subtracted background')

cube = cubeBG;

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
ylim([-28 0])
xlim([0 30])

h1 = legend;
% % Create legend

set(h1,'Orientation','horizontal',...
    'Position',[0.235590277777778 0.72780997983871 0.539583333333333 0.111827956989247],...
    'FontSize',20);
% % axes1 = axes('Parent',gcf,'LineWidth',2,'FontSize',16);
% % legend1 = legend(axes1,'show');
% set(legend1,'Orientation','horizontal',...
%     'Position',[0.235590277777778 0.72780997983871 0.539583333333333 0.111827956989247],...
%     'FontSize',20);

% %%
% xlabel('\lambda (nm)')
% ylabel('MPI (dB)')
% PrepareGraphWithLegend
% title(' ' )

%% total power

t1 = zeros(size(cube1,3),1);
for i = 1:size(cube1,3)
    t1(i) = sum(sum(cube1(:,:,i)));
end
Pos(1)
hold on
plot(timing/60,t1,'b')

t2 = zeros(size(cube2,3),1);
for i = 1:size(cube2,3)
    t2(i) = sum(sum(cube2(:,:,i)));
end

plot(timing/60,t2,'r')

plot(timing/60,t1 + t2,'g')
legend('P_{RC}','P_{LC}','P_{RC} + P_{LC}');
xlabel('Time (min)');
ylabel('Power (A.U.)');
title('Power of polarization projections in time');
PrepareGraphWithLegend


