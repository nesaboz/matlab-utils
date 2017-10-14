function a = ConvertStructToArray(st, field)
% function a = ConvertStructToArray(st, field)
a = zeros(length(st),1);
for i = 1:length(st)
    if ~isempty(getfield(st(i),field))
        a(i) = getfield(st(i),field);
    else
        a(i) = NaN;
    end
end
