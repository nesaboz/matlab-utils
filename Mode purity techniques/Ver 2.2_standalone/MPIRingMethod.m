function [MPI, coeff, profiles1, profiles2] = MPIRingMethod(cubePol1, cubePol2, radius, correctionCoeff, mode)

cube1.data = cubePol1;
cube2.data = cubePol2;

% find cube size
N = size(cube1.data);
if numel(N) == 2
    N(3) = 1;
end

% find Idc
cube1.Idc = mean(cube1.data,3);
cube2.Idc = mean(cube2.data,3);

% find the ring points
[junk, angles, ringPoints] = FindIntensityAroundRingDetailedR0Fixed(cube1.Idc + cube2.Idc, 1, round(N(1)/2), round(N(2)/2), radius, 0:5:355);
close;

switch mode
    case 'LP01'
        
        % find modal amplitudes
        % a1 is OAM+, a2 is OAM-
        % b1 is TEM+, b2 is TEM-
        % c1 = HE11+, c2 = HE11-
        
        
        [a1,b1,cube1.profiles] = FindCubeProfilesAndAB(cube1.data, angles, ringPoints, correctionCoeff);
        [a2,b2,cube2.profiles] = FindCubeProfilesAndAB(cube2.data, angles, ringPoints, correctionCoeff);
        
        
        DC = a1.^2 + a2.^2 + b1.^2 + b2.^2;
        %
        coeff.a = (a1.^2 + a2.^2)./DC;
        coeff.b = (b1.^2 + b2.^2)./DC;
        
        MPI.a = 10*log10( (a2.^2 + a1.^2) ./ DC );
        MPI.a1 = 10*log10( (a1.^2) ./ DC );
        MPI.a2 = 10*log10( (a2.^2) ./ DC );
        MPI.b = 10*log10( (b2.^2 + b1.^2) ./ DC );
        MPI.b1 = 10*log10( (b1.^2) ./ DC );
        MPI.b2 = 10*log10( (b2.^2) ./ DC );
    case 'OAM'
        % find modal amplitudes
        % a1 is OAM+, a2 is OAM-
        % b1 is TEM+, b2 is TEM-
        % c1 = HE11+, c2 = HE11-
        [a1,b1,c1, cube1.profiles] = FindCubeProfilesAndABC(cube1.data, angles, ringPoints, correctionCoeff);
        [a2,b2,c2, cube2.profiles] = FindCubeProfilesAndABC(cube2.data, angles, ringPoints, correctionCoeff);
        
        
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
end


profiles1 = cube1.profiles;
profiles2 = cube2.profiles;