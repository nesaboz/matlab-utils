function TwoModes(E1,E2)
% Shim(abs(E1.x.*E1.x) + abs(E1.y.*E1.y), 1, 'I_1');
% Shim(abs(E2.x.*E2.x) + abs(E2.y.*E2.y), 2, 'I_2');
Shim(abs(E1.x.*E2.x) + abs(E1.y.*E2.y), 1, 'E_1*E_2');