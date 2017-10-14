clc;
close all

% method #1 ordered
pen_indices = FindPenIndices('D26100');
Pos(1)
plot(pen_indices)

% % method #2 ordered
s = xml2struct('D26100.xml');
N = length(s.CapturedImageSequence.CapturedImages.OneCapturedImageData);
for index = 1:N
    temp = s.CapturedImageSequence.CapturedImages.OneCapturedImageData(index);
    pen_indices_all(index) = str2num(temp{1}.tags.string{2}.Text(length('Export Pen Name__:__')+1:end));
end
% 
pen_indices = unique(pen_indices_all);
pen_indices = pen_indices(2:end);

% str = '';
% for i = 1:length(pen_indices)
%     str = [str num2str(pen_indices(i)) ', '];
% end
% str


function pen_indices = FindPenIndices(ID)

% open filename
% go through the file and find the name
% store all pen_indices

fid = fopen([ID '.xml']);
fseek(fid,0,-1);

pen_indices = zeros(5000,1); % that is pen index, pen X and pen Y coordinate

counter = 0;

str = 'Export stage__:__after unpen';

%       <tags>
%         <string>Export stage__:__after unpen</string>
%         <string>Export Pen Name__:__1751</string>
%       </tags>

while ~feof(fid)
    a = fgetl(fid);
    I1 = strfind(a, str);
    if ~isempty(I1)
        % found the pen
        counter = counter + 1;
        % load next line
        a = fgetl(fid);
        
        I1 = strfind(a, 'Export Pen Name__:__');
        I2 = strfind(a, '</string>');
        pen_indices(counter) = str2double(a(I1+20:I2-1));
    end
end
fclose(fid);
pen_indices = pen_indices(1:counter);
pen_indices = pen_indices(1:2:end);

end
