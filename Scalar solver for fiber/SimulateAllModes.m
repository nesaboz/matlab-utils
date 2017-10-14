function [radius, index, LP0, LP1, LP2, coreRadius] = SimulateAllModes(option, M)
% function [radius, index, LP0, LP1, LP2] = SimulateAllModes(option, M)

% option = 1, for step index 
% option = 2, for vortex fiber.
% M is number of sampling points
%
% This code finds the LP0_1d, LP1_1d, LP2_1d using scalar mode solver
%
% Idea:
% 1) make fiber profile
% 2) calculate modes

%% 1) make fiber profile
clc

wavelength = 1.550;

% option = 2;

if nargin < 2
    M = 100;
end

if option == 1
    % option #1 make step index fiber
    N = M;
    radius = (linspace(0.001,100,N))';
    n2 = 1.48;
    delta = 0.003;
    n1 = n2*(1 + delta);
    coreRadius = 16;
    index = n1*(radius<=coreRadius) + n2*(radius > coreRadius);
elseif option == 2
    % option #2 load vortex fiber data
    
    load vortex_fiber_profile.dat; % 'U:\Vortex project\Fiber profile simulations\sims\data1\index_007.dat'
    vortex_fiber_profile = vortex_fiber_profile(1:round(size(vortex_fiber_profile,1)/3),:);
    index = vortex_fiber_profile(1:round(0.7*size(vortex_fiber_profile,1)),1:2);
    % index = downsample(index);
    radius = index(:,1)/7*15;   % here we adjust the preform radius, ... 
    % the loaded  vortex_fiber_profile.dat corresponds to preform size 7.
    index = 1.45 + index(:,2);
    N = size(radius,1); % this is 300
    coreRadius = 0; % only used to calculate V number. Here not important.
else
    msgbox('Enter 1 or 2 for option','modal');
    return
end

% Pos(1);
% plot(radius, index);
% title('Fiber profile');

%% 2) calculate LP0_1d, LP1_1d, LP2_1d profiles 
[neff, Vnumber, LP0] = CalculateNeffEngine(N, 0, radius, index, coreRadius, wavelength);
[neff, Vnumber, LP1] = CalculateNeffEngine(N, 1, radius, index, coreRadius, wavelength);
[neff, Vnumber, LP2] = CalculateNeffEngine(N, 2, radius, index, coreRadius, wavelength);

