function [psi, chi] = PlotEllipseUsingStokesParameters(xc, yc, S, sampling)
S0 = S(:,1);
S1 = S(:,2);
S2 = S(:,3);
S3 = S(:,4);

chi = zeros(size(S,1),1);
psi = zeros(size(S,1),1);
for i = 1:size(S,1);
    if S1(i) == 0
        S1(i) = eps;
    end
    if S2(i) == 0
        S2(i) = eps;
    end
    if S3(i) == 0
        S3(i) = eps;
    end
    
    chi(i) = 0.5*(asind(S3(i)/S0(i)));
    if imag(chi(i))
        chi(i) = 45*sign(S3(i)/S0(i));
    end
    if S1(i)/(S0(i)*cosd(2*chi(i))) > 1
        temp = 1;
    elseif S1(i)/(S0(i)*cosd(2*chi(i))) < -1
        temp = -1;
    else
        temp = S1(i)/(S0(i)*cosd(2*chi(i)));
    end
        
    % psi(i) = sign(S2(i))*0.5*acosd(temp);
    psi(i) = 0.5*acosd(temp);
    if imag(psi(i))
        psi(i) = 0;
    end
    
%     % exceptions
%     if (S1(i) < 0) && (S2(i) < 0) && (S3(i) < 0)
%         psi(i) = psi(i) + 180;
%     end
%     if (S1(i) >0) && (S2(i) < 0) && (S3(i) < 0)
%         psi(i) = psi(i) + 180;
%     end
%     if (S1(i) >0) && (S2(i) < 0) && (S3(i) > 0)
%         psi(i) = psi(i) + 180;
%     end
%     if (S1(i) < 0) && (S2(i) > 0) && (S3(i) > 0)
%         psi(i) = psi(i) + 180;
%     end
        
    
end

if size(S,1) == 1
    S_new = PlotEllipseUsingEllipseParameters(xc, yc, psi, chi, sampling,S0);
else
    S_new = PlotEllipseUsingEllipseParameters(xc, yc, psi, chi, sampling, ones(size(S,1),1));
end
if size(S_new,1) == 1
    disp(['S new = ' num2str(S_new)]);
    disp(['S old = ' num2str(S(i,:))]);
    disp('-----------');
end

