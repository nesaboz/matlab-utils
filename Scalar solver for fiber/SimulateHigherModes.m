function [HE11x, HE11y, TM, HE21o, HE21e, TE, HE11r, HE21r, RADIUS, THETA] = SimulateHigherModes(option, M)
% function [HE11x, HE11y, TM, HE21o, HE21e, TE, HE11r, HE21r, RADIUS, THETA] = SimulateHigherModes(option, M)
% option = 1, for step index 
% option = 2, for vortex fiber.
% M is number of sampling points
%
% This code finds the HE11, HE21, and TE(TM modes) using scalar mode solver
%
% This code is used in ModePuritySimulation
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
    radius = linspace(0.001,50,N);
    n2 = 1.48;
    delta = 0.003;
    n1 = n2*(1 + delta);
    coreRadius = 15;
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

%% 2) calculate HE11 and HE21 modes
L = 0;
[neff, Vnumber, HE11_1d] = CalculateNeffEngine(N, L, radius, index, coreRadius, wavelength);
HE11_1d = HE11_1d(:,1);
L = 1;
[neff, Vnumber, HE21_1d] = CalculateNeffEngine(N, L, radius, index, coreRadius, wavelength);
HE21_1d = HE21_1d(:,1);

% so we got 1d solution, lets find 2d fields out of 1d 
[X, Y, RADIUS, THETA] = CreateCoordinateSystem(M, -radius(end), radius(end), -radius(end), radius(end));

HE11r = zeros(M);
HE21r = zeros(M);
for i = 1:M
    for j = 1:M
        if RADIUS(i,j) >= radius(end)
            HE11r(i,j) = 0;
            HE21r(i,j) = 0;
        else
            HE11r(i,j) = HE11_1d(find(radius>RADIUS(i,j),1));
            HE21r(i,j) = HE21_1d(find(radius>RADIUS(i,j),1));
        end
    end
end

% normalization
HE11r = abs(HE11r);
HE21r = abs(HE21r);

power11 = sum(HE11r(:).^2);
power21 = sum(HE21r(:).^2);
HE11r = HE11r/sqrt(power11);
HE21r = HE21r/sqrt(power21);

l = 2;
% the radial component should be HE31 but we decide on this arbitrary anyway
HE31e.x = abs(HE21r).*cos(l*THETA);
HE31e.y = -abs(HE21r).*sin(l*THETA);
HE31o.x = abs(HE21r).*sin(l*THETA);
HE31o.y = abs(HE21r).*cos(l*THETA);

EH11e.x = abs(HE21r).*cos(l*THETA);
EH11e.y = abs(HE21r).*sin(l*THETA);
EH11o.x = abs(HE21r).*sin(l*THETA);
EH11o.y = -abs(HE21r).*cos(l*THETA);



% handles.HE11.x = handles.HE11.x(100:200, 100:200);
% handles.HE11.y = handles.HE11.y(100:200, 100:200);
% handles.J0 = handles.J0(100:200, 100:200);
% handles.HE21e.x = handles.HE21e.x(100:200, 100:200);
% handles.HE21e.y = handles.HE21e.y(100:200, 100:200);
% handles.HE21o.x = handles.HE21o.x(100:200, 100:200);
% handles.HE21o.y = handles.HE21o.y(100:200, 100:200);
% handles.TE01.x = handles.TE01.x(100:200, 100:200);
% handles.TE01.y = handles.TE01.y(100:200, 100:200);
% handles.TM01.x = handles.TM01.x(100:200, 100:200);
% handles.TM01.y = handles.TM01.y(100:200, 100:200);

% one other interesting way of presenting the modes, but hard to be
% analyzed
% theta = linspace(0,2*pi,N);
% [THETA,RADIUS] = meshgrid(theta,radius);
% [X,Y] = pol2cart(THETA,RADIUS);
% mesh(X,Y,(HE11*cos(L1*theta))); view(45,75)
% mesh(X,Y,(HE11*cos(L1*theta))); view(45,75)

% %% plot modes
% Pos(2);
% mesh(abs(HE11r).^2); view(45,75);
% title('HE11 intensity');
% Pos(3);
% mesh(abs(HE21r).^2); view(45,75);
% title('HE21 intensity');