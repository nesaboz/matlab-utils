function S = CalculateStokesVector(a1,phi1,a2,phi2)
S(1) = a1^2 + a2^2;
S(2) = a1^2 - a2^2;
S(3) = 2*a1*a2*cosd(phi2 - phi1);
S(4) = 2*a1*a2*sind(phi2 - phi1);
S = S/S(1);