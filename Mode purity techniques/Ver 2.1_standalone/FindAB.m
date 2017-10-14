function [a,b] = FindAB(DC, delta)
temp1 = sqrt(DC + delta);
temp2 = sqrt(DC - delta);
if ~isreal(temp2) 
    temp2 = eps*1e10;
end

a = 1/2*(temp1 + temp2);
b = 1/2*(temp1 - temp2);