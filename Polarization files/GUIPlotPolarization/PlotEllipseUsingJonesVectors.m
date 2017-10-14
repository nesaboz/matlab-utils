function [psi, chi, S] = PlotEllipseUsingJonesVectors(xc, yc, ax, phix, ay, phiy, sampling, scale)
% function [psi, chi] = PlotEllipse(xc, yc, ax, phix, ay, phiy, sampling,
% scale)
% See Saleh & Teich, eq. 6.1-6
% xc and yc are center coordinates
% sampling is the number of points used to plot ellipse

% theta is the sampling angle
theta = linspace(0,360-360/sampling,sampling)';
psi = zeros(length(xc), 1);
chi = zeros(length(xc), 1);
% c is a color for patch function (0 is black)
c = zeros(sampling,1);

% in case we want to plot several polarization ellipses
for i = 1:length(xc)
    if ax(i) ~= 0
        R = ay(i)/ax(i);  
        phi = phiy(i) - phix(i);
        
        % psi is ellipse tilt angle
        % psi(i) = 90*(R>1) + 1/2*atand(2*R/(1 - R^2 + eps)*cosd(phi));
        psi(i) = 90*(R>1) + 1/2*atand(2*R/(1 - R^2 + eps)*cosd(phi));  

        % chi gives the elipticity
        chi(i) = 1/2*asind(2*R/(1 + R^2)*sind(phi));
    else
        psi(i) = 90;
        chi(i) = 0;
    end
    
    d = sqrt(ax(i)^2 + ay(i)^2);
    
    % d1 and d2 and big and small axis size
    d1 = scale*d*cosd(chi(i));
    d2 = scale*d*sind(chi(i));
    
    x = xc(i) + d1*cosd(theta)*cosd(psi(i)) - d2*sind(theta)*sind(psi(i));
    y = yc(i) + d1*cosd(theta)*sind(psi(i)) + d2*sind(theta)*cosd(psi(i));
    
    patch(x,y,c,'linewidth',1, 'FaceColor', 'none','EdgeColor','k');
    axis square
    % PutCross(y(1), x(1),1,gcf)  
    if phix(i) >= 0
        arrowIndex = find(theta > phix(i), 1);
    else
        arrowIndex = find(theta > phix(i) + 360, 1);
    end
        
    %  arrow([x(arrowIndex),y(arrowIndex)], ...
    %       [x(arrowIndex + 1),y(arrowIndex + 1)], 'TipAngle', scale);
    
    % arrow([x(sampling/2 + 1),y(sampling/2 + 4)], [x(sampling/2 + 1),y(sampling/2 + 4)], 'TipAngle', 50);
    
end

S = CalculateStokesVector(ax,phix,ay,phiy);
    