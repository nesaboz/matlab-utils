function [a,b,c, cubeProfiles, FScoeff, ringIntensityNew] = FindCubeProfilesAndABC(cube, angles, p, scalingCoeff)
N = size(cube);
if numel(N) == 2
    N(3) = 1;
end

a = zeros(N(3),1);
b = zeros(N(3),1);
c = zeros(N(3),1);
d = zeros(N(3),1);
       
cubeProfiles = zeros(N(3), size(p,1));
ringIntensityNew = zeros(N(3), size(p,1));
FScoeff = zeros(N(3),6);
for i = 1:N(3)
    for j = 1:size(p,1)
        cubeProfiles(i, j) = cube(p(j,1), p(j,2),i);
    end
    
   % find the Fourier series
    [FScoeff(i,:), ringIntensityNew(i,:)] = FourierSeriesForDegrees(angles, cubeProfiles(i,:)', 4);
    % figure; plot(cubeProfiles(,:)); hold on; plot(ringIntensityNew,'r')
    % find the modal amplitudes from Fourier coefficients
    [a(i),b(i)] = FindAB(FScoeff(i,1), FScoeff(i,3));
    
    [junk,junk1,c(i)] = FindABC(FScoeff(i,1), FScoeff(i,2), FScoeff(i,3));
    
    % [~,c(i)] = FindAB(FScoeff(i,1), FScoeff(i,2)); 
    
    c(i) = c(i)/scalingCoeff;
    
    [junk,junk1,d(i)] = FindABC(FScoeff(i,1), FScoeff(i,4), FScoeff(i,3));
    
end

%%
% Pos(1)
% hold on 
% plot(angles, cubeProfiles(i,:)');
% plot(angles, ringIntensityNew,'r');
% Pos(2);
% stem(FScoeff)
% 
% Pos(3);
% bar(FScoeff)
% DC = a(i)^2 + b(i)^2 + c(i)^2;
% bar([a(i)^2/DC, b(i)^2/DC, c(i)^2/DC]); 
% bar([10*log10(a(i)^2),10*log10( b(i)^2), 10*log10(c(i)^2)]); 
% % bar([10*log(a(i)^2/DC), 10*log(b(i)^2/DC), 10*log10(c(i)^2/DC)]); 





