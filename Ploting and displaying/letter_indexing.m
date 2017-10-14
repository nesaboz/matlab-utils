function letter_indexing(x1,y1,s)
% function scalebar(x1,y1)
% draws scalebar on image

h = text( x1, y1 ,texlabel(s));
set(h,'Color',[1 1 1],'HorizontalAlignment','center','FontSize',20);
