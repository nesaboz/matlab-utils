function ext = GetExtension(name)
a = strfind(name, '.');
if length(name) > 3
    ext = name((a(end)+1):end);
else
    ext = '';
end
