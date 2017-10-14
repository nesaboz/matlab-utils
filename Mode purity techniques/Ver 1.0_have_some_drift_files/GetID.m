function ID = GetID(name)

i1 = strfind(name,'_L');
ID = name(1:(i1-1));