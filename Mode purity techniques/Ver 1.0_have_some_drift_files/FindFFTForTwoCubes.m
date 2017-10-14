function [fftCubePol1, fftCubePol2] = FindFFTForTwoCubes(cubePol1, cubePol2)

Idc1 = mean(cubePol1,3);
Idc2 = mean(cubePol2,3);
M = size(cubePol1);
fftCubePol1 = zeros(M);
fftCubePol2 = zeros(M);

tic
h = waitbar(0,'Please wait...');
for k = 1:M(1)
    for l = 1:M(2)
        waitbar(k/M(1),h);
        %%%% NOTE!!! we divide fft by N(3) as the fftStudy has shown as
        %%%% needed
        fftCubePol1(k,l,:) = fft(shiftdim(cubePol1(k,l,:)) - Idc1(k,l))/M(3);
        fftCubePol2(k,l,:) = fft(shiftdim(cubePol2(k,l,:)) - Idc2(k,l))/M(3);
    end
end
toc % 107 sec
close(h);

temp = isnan(fftCubePol1);
if sum(temp(:)) ~= 0
    disp('fft has NaN')
end

temp = isnan(fftCubePol2);
if sum(temp(:)) ~= 0
    disp('fft has NaN')
end
clear temp
disp('Done 5 - Found FFTCubes');
