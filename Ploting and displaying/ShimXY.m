function ShimXY(x,y,im,n,tit)

if nargin < 4
    n = 1;
end    
if nargin < 5
    tit = '';
end

Pos(n); 
image(x(:),y(:),im(:)); 
% image(x,y,im); 
colormap(gray); 
% axis image;
title(tit);