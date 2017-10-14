function S = PlotEllipseUsingEllipseParameters(xc, yc, psi, chi, sampling, scale)
% function PlotEllipseUsingEllipseParameters(psi, chi)
% See Saleh & Teich, eq. 6.1-6
% xc and yc are center coordinates
% sampling is the number of points used to plot ellipse

% theta is the sampling angle
theta = linspace(0,360-360/sampling,sampling)';
% c is a color for patch function (0 is black)
c = zeros(sampling,1);

% in case we want to plot several polarization ellipses
ss = 0;
for i = 1:length(psi)
    
    % a and b are big and small axis size
    a = abs(scale(i)*cosd(chi(i)));
    b = abs(scale(i)*sind(chi(i)));
        
    r = a*b./sqrt((b*cosd(theta)).^2 + (a*sind(theta)).^2);
    ss = ss + sum(imag(r));
    if ss > 0
        disp('Pera');
    end
    
    x = xc(i) + r.*cosd(theta + psi(i));
    y = yc(i) + r.*sind(theta + psi(i));
        
    patch(x,y,c,'linewidth',1, 'FaceColor', 'none','EdgeColor','w');
    axis square
    % PutCross(y(1), x(1),1,gcf)  
%     if phix(i) >= 0
%         arrowIndex = find(theta > phix(i), 1);
%     else
%         arrowIndex = find(theta > phix(i) + 360, 1);
%     end
%         
    %  arrow([x(arrowIndex),y(arrowIndex)], ...
    %       [x(arrowIndex + 1),y(arrowIndex + 1)], 'TipAngle', scale);
    
    % arrow([x(sampling/2 + 1),y(sampling/2 + 4)], [x(sampling/2 + 1),y(sampling/2 + 4)], 'TipAngle', 50);
    
end
S = zeros(length(psi),4);
S(:,1) = scale;
S(:,2) = scale.*cosd(2*chi).*cosd(2*psi);
S(:,3) = scale.*cosd(2*chi).*sind(2*psi);
S(:,4) = scale.*sind(2*chi);