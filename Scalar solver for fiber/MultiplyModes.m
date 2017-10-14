function E = MultiplyModes(E1,E2)
% E = real(E1.x.*conj(E2.x) + E1.y.*conj(E2.y));
E = abs(E1.x.*E2.x + E1.y.*E2.y);