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

for i = 1:numel(h1)
    
    
    %% adjust letters on axes and title
    xName = get(h1(i),'xlabel');
    set(xName,'FontSize',myLetterSize);
    yName = get(h1(i),'ylabel');
    set(yName,'FontSize',myLetterSize);
    
    zName = get(h1(i),'zlabel');
    set(zName,'FontSize',myLetterSize);
    
    titleName = get(h1(i),'title');
    set(titleName,'FontSize',myLetterSize);
    %% set up the box
    box(h1(i),'on');
    %% adjust the data lines
    h2 = get(h1(i),'Children');
    for k = 1:numel(h2)
        set(h2(k),'LineWidth',myLineWidth)
    end
    % adjust the axis lines and numbers
    set(h1(i),'FontSize',myAxisNumberSize)
    set(h1(i),'LineWidth',myLineWidth)
    set(h1(i),'LineWidth',myLineWidth)
    %yTL = (get(h1(i),'YTickLabel'));
    %set(h1(i),'YTickLabel',stryTL(1:2:end));
end

