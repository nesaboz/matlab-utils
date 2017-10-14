function h = Shim(X, position, myTitle)
% function Shim(X, position, myTitle)
%
% N.B. 1/7/11

if nargin < 2
    position = 1;
end    
if nargin < 3
    myTitle = '';
end

Pos(position); h = imagesc(X); colormap(gray); axis off image; title(myTitle,'FontSize',20); colorbar;