function [xcm, ycm, radius] = FindDonutCenterAndRadius(im)
% function [xcm, ycm, radius] = FindDonutCenterAndRadius(im)
% NB 03/11

N = size(im);
% 1) find the center of a LP02 mode, here we use threshold and then
% center of mass
mask = im > 0.3*max(im(:));

[Y,X] = meshgrid(1:N(2),1:N(1));
X = X.*mask;
Y = Y.*mask;
xcm = round(mean(X(X>0)));
ycm = round(mean(Y(Y>0)));

% newIm = (im.^2).*mask;
% newMask = newIm > 0.5*max(newIm(:));
% Shim(newMask)


% im1 = im./max(im(:));
% tempX = X.*im1;
% tempY = Y.*im1;
% xcm = round(mean(tempX(X>0)));
% ycm = round(mean(tempY(Y>0)));


maxima = zeros(8,1);
p = zeros(8,2);

xcmOld = xcm;
ycmOld = ycm;
bool = 1; % when center spot converge, bool will become 0
k = 0;
while bool
    % 2) find 4 max points points: right, up, left and down
    
%     [m,I] = max(z);
%     I
%     z1 = conv(im(xcm, (ycm+1):N(2)),1/9*ones(1,9));
%    
%     close; plot(z); hold on; plot(z1(5:end-4))
    
    d = 9;
    [maxima(1),I] = max(conv(im(xcm, (ycm+1):N(2)),1/d*ones(1,d)));
    p(1,:) = [xcm, ycm + I - (d-1)/2];
    [maxima(3),I] = max(conv(im(1:(xcm-1),ycm),1/d*ones(1,d)));
    p(3,:) = [I - (d-1)/2, ycm];
    [maxima(5),I] = max(conv(im(xcm,1:ycm),1/d*ones(1,d)));
    p(5,:) = [xcm, I - (d-1)/2];
    [maxima(7),I] = max(conv(im((xcm+1):N(1),ycm),1/d*ones(1,d)));
    p(7,:) = [xcm + I - (d-1)/2, ycm];
    
    % 3) find new better donut center
    xcm = round(mean([p(3,1),p(7,1)]));
    ycm = round(mean([p(1,2),p(5,2)]));
        
    if abs(xcm - xcmOld) <= 1 && abs(ycm - ycmOld) <= 1 
        bool = 0;
    end 
    xcmOld = xcm;
    ycmOld = ycm;
    k = k + 1;
    if k > 10
        bool = 0;
    end
end

radius = mean(abs([ycm - p(5,2), p(1,2) - ycm, xcm - p(3,1), p(7,1) - xcm]));
