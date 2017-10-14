function L = FindLength(stack)
N = numel(stack);
for i = 1:N
    nameStack{i} = stack(i).name;
end
disp('Done 1-  Load stack')

i1 = strfind(nameStack{1},'_L');
i2 = strfind(nameStack{1},'m_w');
L = str2double(stack(1).name((i1+2):(i2-1)));
