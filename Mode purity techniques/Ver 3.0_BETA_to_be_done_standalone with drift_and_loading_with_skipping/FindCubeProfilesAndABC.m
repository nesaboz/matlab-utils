function [a,b,c, cubeProfiles] = FindCubeProfilesAndABC(cube, angles, p)
N = size(cube);
if numel(N) == 2
    N(3) = 1;
end

a = zeros(N(3),1);
b = zeros(N(3),1);
c = zeros(N(3),1);
cubeProfiles = zeros(N(3), size(p,1));
for i = 1:N(3)
    for j = 1:size(p,1)
        cubeProfiles(i, j) = cube(p(j,1), p(j,2),i);
    end
    
   % find the Fourier series
    [coeff, ringIntensityNew] = FourierSeriesForDegrees(angles, cubeProfiles(i,:)', 2);
     
    % find the modal amplitudes from Fourier coefficients
    %[a(i),b(i)] = FindAB(coeff(1), coeff(3));
    [a(i), b(i), c(i)] = FindABC(coeff(1), coeff(2), coeff(3));
    % [junk, junk1, c(i)] = FindABC(coeff(1), coeff(2), coeff(3));
    
    % here we correct for J0(r0)/J1(r0) = 0.87;
    c(i) = c(i)/0.94; 
    % [~,c] = FindAB(coeff(1), coeff(2)); 
end

%%
% Pos(1)
% hold on 
% plot(angles, cubeProfiles(i,:)');
% plot(angles, ringIntensityNew,'r');
% Pos(2);
% stem(coeff)
% 
% Pos(3);
% bar(coeff)
% DC = a(i)^2 + b(i)^2 + c(i)^2;
% bar([a(i)^2/DC, b(i)^2/DC, c(i)^2/DC]); 
% bar([10*log10(a(i)^2),10*log10( b(i)^2), 10*log10(c(i)^2)]); 
% % bar([10*log(a(i)^2/DC), 10*log(b(i)^2/DC), 10*log10(c(i)^2/DC)]); 





