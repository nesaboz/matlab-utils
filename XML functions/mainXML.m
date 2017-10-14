clc;
close all


% method #1 ordered
pen_indices = FindPenIndices('D26100');
Pos(1)
plot(pen_indices)

% % method #2
s = xml2struct('D26100.xml');
N = length(s.CapturedImageSequence.CapturedImages.OneCapturedImageData);
for index = 1:N
    temp = s.CapturedImageSequence.CapturedImages.OneCapturedImageData(index);
    pen_indices_all(index) = str2num(temp{1}.tags.string{2}.Text(length('Export Pen Name__:__')+1:end));
end
% 
% pen_indices = unique(pen_indices_all);
% pen_indices = pen_indices(2:end);


str = '';
for i = 1:length(pen_indices)
    str = [str num2str(pen_indices(i)) ', '];
end
str
