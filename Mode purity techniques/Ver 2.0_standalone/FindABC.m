function [a,b,c] = FindABC(DC, delta1, delta2)
alpha = sqrt(DC + delta1 + delta2);
beta = 1/2*(delta1 + delta2);
if alpha^2 < 4*beta
    a = 1/2*alpha;
else
    a = 1/2*(alpha + sqrt(alpha^2 - 4*beta));
end

b = delta2/2/a;
c = delta1/2/a;
