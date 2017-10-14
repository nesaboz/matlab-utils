function [MPI, coeff] = MPIRingMethod(cubePol3, cubePol4)

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
[junk, angles, p] = FindIntensityAroundRingDetailedR0Fixed(cube3.Idc + cube4.Idc, 1, xcm, ycm, radius, 0:5:355);
close;
% find modal amplitudes
% a1 is OAM+, a2 is OAM-
% b1 is TEM+, b2 is TEM-
% c1 = HE11+, c2 = HE11-
[a1,b1,c1, cube3.profiles] = FindCubeProfilesAndABC(cube3.data, angles, p);
[a2,b2,c2, cube4.profiles] = FindCubeProfilesAndABC(cube4.data, angles, p);


DC = a1.^2 + a2.^2 + b1.^2 + b2.^2 + c1.^2 + c2.^2; 
% 
coeff.a = (a1.^2 + a2.^2)./DC;
coeff.b = (b1.^2 + b2.^2)./DC;
coeff.c = (c1.^2 + c2.^2)./DC;

MPI.a = 10*log10( (a2.^2 + a1.^2) ./ DC );
MPI.a1 = 10*log10( (a1.^2) ./ DC );
MPI.a2 = 10*log10( (a2.^2) ./ DC );
MPI.b = 10*log10( (b2.^2 + b1.^2) ./ DC );
MPI.b1 = 10*log10( (b1.^2) ./ DC );
MPI.b2 = 10*log10( (b2.^2) ./ DC );
MPI.c = 10*log10( (c2.^2 + c1.^2) ./ DC );
MPI.c1 = 10*log10( (c1.^2) ./ DC );
MPI.c2 = 10*log10( (c2.^2) ./ DC );
