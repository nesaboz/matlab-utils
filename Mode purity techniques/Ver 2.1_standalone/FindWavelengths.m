function [lambda, L] = FindWavelengths(stack)
N = numel(stack);
for i = 1:N
    nameStack{i} = stack(i).name;
end
disp('Done 1-  Load stack')

% if numel(i) == 0
%     i = strfind(nameStack{1},'L');
%     L = str2double(stack(1).name(i + (1:4))); % meters
% else
%     L = str2double(stack(1).name(i + (2:5))); % meters
% end

i1 = strfind(nameStack{1},'_L');
i2 = strfind(nameStack{1},'m_w');
L = str2double(stack(1).name((i1+2):(i2-1)));

disp(['L = ' num2str(L) ' m']);
lambda = zeros(N,1);
for i = 1:N
    iBegin = strfind(nameStack{i},'_w');
    
    iEnd = strfind(nameStack{i},'nm');
    lambda(i) = str2double(nameStack{i}(iBegin + 2: iEnd(end)-1));
end

disp('Done 2 - found wavelengths')