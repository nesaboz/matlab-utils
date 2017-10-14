% won't work if there is legend in the graph
h = gcf;
h1 = get(h,'Children');
set(h,'Color',[1 1 1])

% input
myLetterSize = 24;
myAxisNumberSize = 16;
myLineWidth = 2;
myName = 'nesa.eps';

set(h1(2),'FontSize',myAxisNumberSize)
% set(h1(2),'LineWidth',myLineWidth)

% 
% %% adjust letters on axes and title
% xName = get(h1,'xlabel');
% if numel(xName) > 1
%     for i = 1:numel(xName)
%         set(xName{i},'FontSize',myLetterSize);
%     end
% else
%     set(xName,'FontSize',myLetterSize);
% end
% 
% yName = get(h1,'ylabel');
% 
% if numel(yName) > 1
%     for i = 1:numel(yName)
%         set(yName{i},'FontSize',myLetterSize);
%     end
% else
%     set(yName,'FontSize',myLetterSize);
% end
% 
% h1(2).FontSize = myAxisNumberSize;
% 
% set(h1,'FontSize',myAxisNumberSize)
% 
% h = get(gca, 'Title'); 
% titleName = get(h,'String');
% title(titleName,'FontSize',myLetterSize);
% 
% colorbar('Fontsize',20)
% 
% set(h1,'FontSize',myAxisNumberSize)
% set(h1,'LineWidth',myLineWidth)
% set(h1,'LineWidth',myLineWidth)