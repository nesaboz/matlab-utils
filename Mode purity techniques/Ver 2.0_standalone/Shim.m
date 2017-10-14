function h = Shim(X, position, myTitle, limits)
% function Shim(X, position, myTitle)
%
% N.B. 1/7/11



if nargin < 2
    position = 1;
end    
if nargin < 3
    myTitle = '';
end

if nargin < 4
    limits = [min(X(:)), max(X(:))];
    
    if sum(limits == [0 0]) == 2
        limits = [0 1];
    end
    
end

Pos(position); 
h = imagesc(X, limits); 
colormap(gray); 
axis off image; 
title(myTitle,'FontSize',20,'Interpreter','None'); 
colorbar;