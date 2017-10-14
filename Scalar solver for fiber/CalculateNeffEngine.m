function [neff, Vnumber, fieldDistribution] = CalculateNeffEngine(N, L, radius, index, coreRadius, wavelength)
% function [neff, Vnumber, fieldDistribution] = CalculateNeffEngine(N, L, radius, index, coreRadius, wavelength)
%
% This code is the main engine for finding effective indices for a fiber with a given 
% geometry index vs radius.
% N is the number of sampling points in the radius (i.e. length of radius)
% L is the mode angular number
% coreRadius is meaningful only for step-index fibers, where we want to 
% find the V number.
%
% N.B. 2/8/11
% code is taken from folder EC568
if radius(1) == 0
    radius(1) = 0.001;
end
numberOfWavelengths = length(wavelength);
neff = zeros(numberOfWavelengths, N);
% beta_m = zeros(numberOfWavelengths, N);

fieldDistribution = zeros(N, N, numberOfWavelengths);
Vnumber = zeros(numberOfWavelengths,1);

% wp = zeros(numberOfWavelengths,1);

% find guided modes and neff for them
for wavelengthIndex = 1:numberOfWavelengths
    k0 = 2*pi/wavelength(wavelengthIndex);
    Vnumber(wavelengthIndex) = k0*coreRadius*(index(1)^2 - index(end)^2)^0.5;
    
    modeSolverMatrix = BuildModeSolverMatrix(radius, index, k0, L);
    
    % %Eigenvalues 'D' and Eigenvectors 'V' of diagonal matrix are found.
    % But the solutions found are all jumbled up. So, Sort the solutions.
    % Largest beta (eigenvalue) first:
    
    % 1) just for D
    % D = eig(modeSolverMatrix);
    % [beta_sqr,I] = sort(D,'descend');
    
    % 2) or for V and D
    [V,D] = eig(modeSolverMatrix);
    [beta_sqr,I] = sort(diag(D),'descend');
        
    V = V(:,I);
    % note radial distibution is field_r(:,m)
    field_r = V; % is a radial distribution of all LPlm fields, many of them not supported
    % beta_m(wavelengthIndex,:) = sqrt(beta_sqr);
    fieldDistribution(:,:,wavelengthIndex) = field_r;
    neff(wavelengthIndex,:) = sqrt(beta_sqr)*wavelength(wavelengthIndex)/2/pi;
    
    %    wp(wavelengthIndex) = realsqrt( 2 * sum(field_r(:,m).^2*dr) / sum( diff(field_r(:,m)).^2 .* radius(1:end-1) / dr  ) );
end
