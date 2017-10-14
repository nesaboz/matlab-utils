function matrix = BuildModeSolverMatrix(radius, index, k0, L)
% function matrix = BuildModeSolverMatrix(radius, index, k0, L)
% 
% This code is used for solving scalar approximation of wave Helmholtz
% equation for the fiber with a given profile, index vs radius
% k0 is a wavenumber
% L is azimuthal mode number 
%
% N.B. 2/8/11

N = length(radius);
r = radius;

% Boundary conditions for matlab to do this computation - do not change
rr = 0;
ll = mod(L,2) + 1;
dr = r(2) - r(1);

% Build Matrix. This is the main part of the mode solver engine.
matrix = zeros(N);
% Inner part of diagonal matrix
for i = 2:N-1
    matrix(i,i-1) = 1/(dr^2)-1/(r(i)*2*dr);
    matrix(i,i)	= (index(i).^2)*k0^2 - 2/dr.^2-(L^2)/(r(i)^2);
    matrix(i,i+1) = 1/(dr^2)+1/(r(i)*2*dr);
end
%Outer part (boundaries) left part
if ll == 0
    matrix(1,1) = (index(1).^2)*k0^2 - 2/dr.^2-(L^2)/(r(1)^2);
    matrix(1,2) = 1/(dr^2)+1/(r(1)*2*dr);
elseif ll == 1
    matrix(1,1) = (index(1).^2)*k0^2 - 1/dr.^2-1/(r(1)*2*dr)-(L^2)/(r(1)^2);
    matrix(1,2) = 1/(dr^2)+1/(r(1)*2*dr);
else
    matrix(1,1) = (index(1).^2)*k0^2 - 3/dr.^2+1/(r(1)*2*dr)-(L^2)/(r(1)^2);
    matrix(1,2) = 1/(dr^2)+1/(r(1)*2*dr);
end

%Right part
if rr == 0
    matrix(N,N) = (index(N).^2)*k0^2 - 2/dr.^2-(L^2)/(r(N)^2)+1/(r(N)*2*dr);
    matrix(N,N-1) = 1/(dr^2)+1/(r(N)*2*dr);
    
elseif rr == 1
    matrix(N,N) = (index(N).^2)*k0^2 - 1/dr.^2+1/(r(N)*2*dr)-(L^2)/(r(N)^2);
    matrix(N,N-1) = 1/(dr^2)+1/(r(N)*2*dr);
    
else
    matrix(N,N) = (index(N).^2)*k0^2 - 3/dr.^2+1/(r(N)*2*dr)-(L^2)/(r(N)^2);
    matrix(N,N-1) = 1/(dr^2)+1/(r(N)*2*dr);
end
