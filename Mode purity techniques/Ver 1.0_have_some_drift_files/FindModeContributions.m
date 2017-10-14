function cube = FindModeContributions(cube, angles, ringPoints, scalingCoeff)
N = size(cube.data);
if numel(N) == 2
    N(3) = 1;
end

cube.profiles = zeros(N(3), size(ringPoints,1));
cube.ringIntensityNew = zeros(N(3), size(ringPoints,1));
FScoeff = zeros(N(3),6);
coeff = zeros(size(FScoeff));

for i = 1:N(3)
    for j = 1:size(ringPoints,1)
        cube.profiles(i, j) = cube.data(ringPoints(j,1), ringPoints(j,2),i);
    end
    
   % find the Fourier series
    [FScoeff(i,:), cube.ringIntensityNew(i,:)] = FourierSeriesForDegrees(angles, cube.profiles(i,:)', 4);
    % figure; plot(cubeProfiles(,:)); hold on; plot(ringIntensityNew,'r')
    % find the modal amplitudes from Fourier coefficients

    [coeff(i,1), coeff(i,2)] = FindAB(FScoeff(i,1), FScoeff(i,3)); % second dominant mode
    [junk,junk1, coeff(i,3)] = FindABC(FScoeff(i,1), FScoeff(i,2), FScoeff(i,3)); % other modes
    [junk,junk1, coeff(i,4)] = FindABC(FScoeff(i,1), FScoeff(i,4), FScoeff(i,3)); % other modes
    [junk,junk1, coeff(i,5)] = FindABC(FScoeff(i,1), FScoeff(i,5), FScoeff(i,3)); % other modes
    [junk,junk1, coeff(i,6)] = FindABC(FScoeff(i,1), FScoeff(i,6), FScoeff(i,3)); % other modes
    
    % [~,c(i)] = FindAB(FScoeff(i,1), FScoeff(i,2)); 
    
    coeff(i,3) = coeff(i,3)/scalingCoeff;    
end

cube.FScoeff = FScoeff;
cube.coeff = coeff;


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

