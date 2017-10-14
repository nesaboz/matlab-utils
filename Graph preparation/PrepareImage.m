% won't work if there is legend in the graph
h = gcf;
PosTo(1)
h1 = get(h,'Children');
set(h,'Color',[1 1 1])

% input
myLetterSize = 24;
myAxisNumberSize = 16;
myLineWidth = 2;
myName = 'nesa.eps';

h=get(gca,'Title'); 
titleName = get(h,'String');
title(titleName,'FontSize',myLetterSize);

axis off
colorbar('Fontsize',20)