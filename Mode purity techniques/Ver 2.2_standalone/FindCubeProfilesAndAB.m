function [a,b,cubeProfiles] = FindCubeProfilesAndAB(cube, angles, ringPoints, correctionCoeff)
N = size(cube);
if numel(N) == 2
    N(3) = 1;
end

a = zeros(N(3),1);
b = zeros(N(3),1);

cubeProfiles = zeros(N(3), size(ringPoints,1));
for i = 1:N(3)
    for j = 1:size(ringPoints,1)
        cubeProfiles(i, j) = cube(ringPoints(j,1), ringPoints(j,2),i);
    end
    
   % find the Fourier series
    [coeff, ~] = FourierSeriesForDegrees(angles, cubeProfiles(i,:)', 2);
     
    % find the modal amplitudes from Fourier coefficients
    [a(i), b(i)] = FindAB(coeff(1), coeff(2));
    % here we correct for J0(r0)/J1(r0)
    a(i) = a(i)/correctionCoeff; 
end
