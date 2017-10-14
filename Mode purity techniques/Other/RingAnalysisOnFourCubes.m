% Ring
clc;
% [stack, pathname] = LoadStack('C:\NENAD_DATA\ImagingData\2012_02_08\B - extinction ratio\ThreeCubes');
% [stack, pathname] = LoadStack('C:\NENAD_DATA\ImagingData\2012_02_14\A - spiral flip with polcon');
[stack, pathname] = LoadStack('C:\NENAD_DATA\ImagingData\');

disp(pathname);
if numel(stack) == 0
    return
end

[cubeBG, ~, ~] = ConvertStackToMatrix(stack);
% cubeBG(:,:,111:235);
% 3) subtract background
bg = LoadImage('C:\NENAD_DATA\ImagingData\2012_01_25\bg\bg_exp13000.tif');

N = size(cubeBG);
if numel(N) == 2
    N(3) = 1;
end

bgValue = mean(bg(:));
cube = cubeBG;
arr = zeros(1,N(3));
for i=1:N(3)
    % local BG subtraction
    %temp = cubeBG(N(1)/2 + (-20:20),1:50,i);
    % temp = cubeBG(N(1) + (-20:-1), 1:20,i);
    temp = cubeBG(N(1)/2 + (-10:10), N(2)/2 + (-10:10),i);
            
    bgValue = mean(temp(:));
   
    arr(i) = bgValue;
    cube(:,:,i) = cubeBG(:,:,i) - bgValue;
end
disp(['mean BG = ' num2str(mean(arr))]);
cube(cube<0) = eps*1e10;
disp('Done 3 - subtracted background')
%
% 4) crop cubes
[cubePol1, cubePol2, cubePol3, cubePol4, M] = ExtractFourCubes(cube);

% find the ring around cubePol3
N = size(cube);
if numel(N) == 2
    N(3) = 1;
end


%%

MPI = MPIRingMethod(cubePol3, cubePol4);


%%
Pos(2)
% i1 = 549;
% i2 = 649;
hold on
plot(MPI.a1,'b')
plot(MPI.a2,'k')
plot(MPI.b,'g')
plot(MPI.c,'m')
% plot(MPI.b1,'g')
% plot(MPI.c1,'m')
% plot(MPI.b2,'g')
% plot(MPI.c2,'m')

legend('V_{21}^{+}','V_{21}^{-}', 'V_{T}^{+ and -}','V_{11}^{+ and -}')

legend('Location','NorthEastOutside')

title('Mode power (dB)');
xlabel('Tuning parameter (A.U.)');
ylabel('Power contribution (dB)')

PrepareGraphWithLegend
h = legend('Location','NorthEastOutside');
set(h,'FontSize',20);

% axis([0 110 -30 0])

%% 
wavelength = GetWavelengths(stack);

% %% extract names
% timing = GetTimeStamps(stack);
% 
% Pos(2)
% % i1 = 549;
% % i2 = 649;
% hold on
% plot(timing, MPI.a1,'b')
% plot(timing, MPI.a2,'k')
% plot(timing, MPI.b,'g')
% plot(timing, MPI.c,'m')
% 
% legend('V_{21}^{+}','V_{21}^{-}', 'V_{T}^{+ and -}','V_{11}^{+ and -}')
% 
% legend('Location','NorthEastOutside')
% 
% title('Mode power (dB)');
% xlabel('Time (s)');
% ylabel('Power contribution (dB)')
% PrepareGraphWithLegend
% legend('Location','NorthEastOutside')
% % axis([0 110 -30 0])
% 

