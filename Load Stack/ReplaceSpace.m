function name = ReplaceSpace(name)
for i = 1:length(name)
    if name(i) == ' '
        name(i) = '_';
    end
end
