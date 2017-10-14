function [IA, IB] = RecoverModes(fftCube, Idc, iBegin, iEnd, method)

if nargin < 5
    method = 1;
end
peakIntensitySquared = sum(abs(fftCube(:,:,iBegin:iEnd)).^2,3);

% two methods to reconstruct modes:
% 1) S^2 method, 2) sumproduct
switch method
case 1
    IA = peakIntensitySquared./(Idc + eps*1e10);
    IB = Idc;
case 2
    temp = Idc.^2 - 4.*peakIntensitySquared;
    temp(temp<0) = eps*1e10;
    IA = 0.5*(Idc - sqrt(temp));
    IB = 0.5*(Idc + sqrt(temp));
end
