function [MPI, coeff, cube3, cube4] = MPIRingMethod(cubePol3, cubePol4, scalingCoeff)
if nargin < 3
    scalingCoeff = 1;
end

cube3.data = cubePol3;
cube4.data = cubePol4;

% find cube size
N = size(cube3.data);
if numel(N) == 2
    N(3) = 1;
end

% find Idc
cube3.Idc = mean(cubePol3,3);
cube4.Idc = mean(cubePol4,3);

% find the ring points
[xcm, ycm, radius] = FindDonutCenterAndRadius(abs(cube3.Idc + cube4.Idc));
[junk, angles, p] = FindIntensityAroundRingDetailedR0Fixed(cube3.Idc + cube4.Idc, 0, xcm, ycm, radius, 0:5:355);
% close;
% find modal amplitudes
% a1 is OAM+, a2 is OAM-
% b1 is TEM+, b2 is TEM-
% c1 = HE11+, c2 = HE11-
[a1,b1,c1, cube3.profiles, cube3.FScoeff, cube3.profilesFit] = FindCubeProfilesAndABC(cube3.data, angles, p, scalingCoeff);
[a2,b2,c2, cube4.profiles, cube4.FScoeff, cube4.profilesFit] = FindCubeProfilesAndABC(cube4.data, angles, p, scalingCoeff);

%%
% Pos(1);
% Pos(2);
% for i = 1:5    
%     figure(1)
%     plot(cube3.profiles(i,:));
%     hold on
%     plot(ringIntensityNew3(i,:),'r');
%     figure(2)
%     ShimGcf(cubePol3(:,:,i));
%     pause
%     cla
% end
%%
% 
% Pos(1)
% plot(cube3.FScoeff);
% legend('1','2','3','4','5','6')
% Pos(2)
% plot(cube4.FScoeff);
% legend('1','2','3','4','5','6')
% Pos(4)
% plot(cube3.FScoeff(:,1));
% hold on
% plot(cube4.FScoeff(:,1)*2.8,'r');
% hold off
% 
% % Pos(4)
% plot(cube3.FScoeff(:,3) + cube4.FScoeff(:,3),'r');
% 
% Pos(4)
% plot(cube3.FScoeff(:,1) + cube4.FScoeff(:,1),'b');


% stem(mean(cube3.FScoeff,1));
% Pos(2)
% stem(mean(cube4.FScoeff,1));


DC = a1.^2 + a2.^2 + b1.^2 + b2.^2 + c1.^2 + c2.^2; 
% 

coeff.a1 = (a1.^2)./DC;
coeff.b1 = (b1.^2)./DC;
coeff.c1 = (c1.^2)./DC;
coeff.a2 = (a2.^2)./DC;
coeff.b2 = (b2.^2)./DC;
coeff.c2 = (c2.^2)./DC;

coeff.a = (a1.^2 + a2.^2)./DC;
coeff.b = (b1.^2 + b2.^2)./DC;
coeff.c = (c1.^2 + c2.^2)./DC;

MPI.a = 10*log10( coeff.a );
MPI.a1 = 10*log10( coeff.a1 );
MPI.a2 = 10*log10( coeff.a2 );
MPI.b = 10*log10( (b2.^2 + b1.^2) ./ DC );
MPI.b1 = 10*log10( (b1.^2) ./ DC );
MPI.b2 = 10*log10( (b2.^2) ./ DC );
MPI.c = 10*log10( (c2.^2 + c1.^2) ./ DC );
MPI.c1 = 10*log10( (c1.^2) ./ DC );
MPI.c2 = 10*log10( (c2.^2) ./ DC );
