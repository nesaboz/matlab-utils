function PrepareGraphWithLegendNE(index, style)
if nargin < 1
    index = 2;
end

if nargin < 2
    style = 'tex';
end
    
h = gcf;
PosTo(index)
h1 = get(h,'Children');
myLegend = get(h1(1),'String');

legend off

h = gcf;
h1 = get(h,'Children');
set(h,'Color',[1 1 1])

% input
myLetterSize = 16;
myAxisNumberSize = 16;
myLineWidth = 2;
myName = 'pera.eps';

%% adjust letters on axes and title
xName = get(h1,'xlabel');
set(xName,'FontSize',myLetterSize);
yName = get(h1,'ylabel');
set(yName,'FontSize',myLetterSize);
titleName = get(h1,'title');
set(titleName,'FontSize',myLetterSize);
%% set up the box
box(h1,'on');
%% adjust the data lines
h2 = get(h1,'Children');
for i = 1:numel(h2)
    set(h2(i),'LineWidth',myLineWidth)
end
% adjust the axis lines and numbers
set(h1,'FontSize',myAxisNumberSize)
set(h1,'LineWidth',myLineWidth)
set(h1,'LineWidth',myLineWidth)
%yTL = (get(h1,'YTickLabel'));
%set(h1,'YTickLabel',stryTL(1:2:end));
%% legend
h = legend(myLegend,'interpreter',style);
set(h,'FontSize',20,'Location','NorthEastOutside')

% legend(myLegend)
% legend(myLegend,'interpreter','none')
% title('Transmission loss spectra')
