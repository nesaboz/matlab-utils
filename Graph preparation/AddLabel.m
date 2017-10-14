function AddLabel(x, y, str, fontsize)
% function AddLabel(x, y, str, fontsize)
% usage: im = LoadImage; AddLabel(im, str, fontsize)

if nargin < 4
    fontsize = 14;
end

% Place the following line after createing the figure but before ploting
% axes1 = axes('Parent',figure1,'FontSize',14);

h = text(x, y, str ,'Color',[1 1 1], 'FontSize', fontsize);



