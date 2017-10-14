function ext = GetExtension(name)
if length(name) > 3
    ext = name(end-2:end);
else
    ext = '';
end