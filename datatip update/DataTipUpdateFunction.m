function output_txt = DataTipUpdateFunction(obj, event_obj)
% Display the position of the data cursor
% obj          Currently not used (empty)
% event_obj    Handle to event object
% output_txt   Data cursor text string (string or cell array of strings).

pos = get(event_obj,'Position');

h = gcf;
h1 = get(h, 'Children');
h2 = get(h1(2),'Children');
xdata = get(h2,'XData');
N = length(xdata);
m = max(xdata) - min(xdata);

output_txt = {['X: ',num2str(pos(1),10) ', I: ',num2str(round((pos(1) - min(xdata))/m*N) + 1,10)],...
    ['Y: ',num2str(pos(2),7)]};

% If there is a Z-coordinate in the position, display it as well
if length(pos) > 2
    output_txt{end+1} = ['Z: ',num2str(pos(3),7)];
end