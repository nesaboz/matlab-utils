function AddInsideLabels(aa)
yb = cat(1, aa.YData);
xb = bsxfun(@plus, aa(1).XData, [aa.XOffset]');
hold on;
htxt = text(xb(:),yb(:), cellstr(num2str(yb(:))), ...
    'rotation', 90, 'horiz', 'right');
% set(htxt(1:3:end), 'color', 'w'); % for legibility
