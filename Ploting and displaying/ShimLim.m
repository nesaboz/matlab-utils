function ShimLim(im,n,tit,clim)
% function Shim(im,n,tit)
%
% N.B. 12/08

if nargin < 2
    n = 5;
end    
if nargin < 3
    tit = '';
end

Pos(n); imagesc(im,clim); colormap(gray); axis off image; title(tit); colorbar;