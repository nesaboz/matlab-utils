function [lowPassFilter, mask] = LowPassFilter2D(N,kg,delta)
% function [lowPassFilter, mask] = LowPassFilter2D(N,kg,delta)
%
% N is the size of the matrix
% kg is the cut-off
% delta is the roll-off
%
% mask is a region where filter is non-zero.
%
% N.Bozinovic, 12/08/08

N1 = N(1);
N2 = N(2);
kx = -round(N(1)/2):round(N(1)/2)-1;
ky = -round(N(2)/2):round(N(2)/2)-1;

[Kx,Ky] = meshgrid(kx,ky);
Kx = Kx';
Ky = Ky';

Nc1 = round(N1/2);
Nc2 = round(N2/2);

% lowPassFilter = low pass 2D filter;
K = sqrt(Kx.^2 + Ky.^2);
mask1 = (K > kg+delta);
mask2 = (K < kg-delta);
mask = mask1 + mask2;

lowPassFilter = zeros(size(K));
for i = round(-kg-delta):round(kg+delta)
    for j = round(-kg-delta):round(kg+delta)
        if K(Nc1 + i, Nc2 + j) <= kg - delta
            lowPassFilter(Nc1+i,Nc2+j) = 1;
        elseif (K(Nc1 + i, Nc2 + j) > kg - delta) && (K(Nc1 + i, Nc2 + j) < kg + delta)
            lowPassFilter(Nc1+i,Nc2+j) = 1/2*(1 - sin(pi*(K(Nc1 + i, Nc2 + j)-kg)/2/delta));
        end
    end
end

mask = 1 - mask;
