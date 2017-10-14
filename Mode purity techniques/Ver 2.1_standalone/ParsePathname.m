function name = ParsePathname(pathname)

index = strfind(pathname, filesep);
for i = 1:length(index)-1
    name{i} = pathname(index(i)+1:index(i+1)-1);
end
    