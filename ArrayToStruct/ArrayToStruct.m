function s = ArrayToStruct(arr)
for i = 1:length(arr)
    s{i} = num2str(arr(i));
end