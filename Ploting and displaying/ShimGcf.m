function h = ShimGcf(im,tit)
% function ShimGcf(im,tit)

if nargin < 2
    tit = '';
end
%figure(gcf);
h = imagesc(im); colormap(gray); axis off image; title(tit,'Interpreter','None'); colorbar;