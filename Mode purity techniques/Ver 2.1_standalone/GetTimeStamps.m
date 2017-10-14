function timing = GetTimeStamps(stack)

% get time stamps
N = numel(stack);
timing = zeros(N,1);
for i = 1:N
    a = strfind(stack(i).name,'_T');
    a = a(end);
    timing(i) = str2num(stack(i).name(a+2:a+3))*3600 + ...
                str2num(stack(i).name(a+6:a+7))*60 + ...
                str2num(stack(i).name(a+10:a+14));    
end
timing = timing - timing(1);
disp('Done - found timings')
