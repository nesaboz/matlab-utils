function ShimGcfXY(x,y,im,tit)

if nargin < 4
    tit = '';
end

imagesc(x,y,im); colormap(gray); axis image; title(tit);