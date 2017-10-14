function PutCross(x,y,s,fig,color)
% function PutCross(x,y,s,fig,color)
% puts cross at the point (x,y) of figure fig. Default color is cyan [0.5 1 1], and
% default size s is 3x3 pixels
if nargin < 3
    s = [3 3];
end
if nargin < 4
    fig = gcf;
end
if nargin < 5
    color = [0.5 1 1];
end

figure(fig);
if length(s) < 2
    s = [s s];
end
h1 = patch([x-s(1) x+s(1)],[y-s(2) y+s(2)],'w','LineWidth',2,'EdgeColor',color);
h2 = patch([x+s(1) x-s(1)],[y-s(2) y+s(2)],'w','LineWidth',2,'EdgeColor',color);