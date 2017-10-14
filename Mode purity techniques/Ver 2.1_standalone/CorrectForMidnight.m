function timing = CorrectForMidnight(timing)

I = find(diff(timing) >= 1000);
if numel(I) ~= 0
    x1 = timing(1:I);
    x2 = timing((I+1):end) - timing(end) - (timing(2) - timing(1));
    timingNew = [x2; x1];
    timing = timingNew - timingNew(1);
end
