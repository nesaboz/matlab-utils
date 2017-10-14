function MeshGcf(im,tit)

if nargin < 4
    tit = '';
end

mesh(im); 
colormap(gray); 
axis image; 
title(tit);