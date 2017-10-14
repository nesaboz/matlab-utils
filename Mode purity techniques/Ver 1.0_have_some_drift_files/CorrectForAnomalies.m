function [xCenters, yCenters] = CorrectForAnomalies(xCenters, yCenters)

xcm1 = median(xCenters(1:10,1));
xcm2 = median(xCenters(1:10,2));
ycm1 = median(yCenters(1:10,1));
ycm2 = median(yCenters(1:10,2));


if abs(xCenters(1,1) - xcm1) > 1
    xCenters(1,1) = xcm1;
end
if abs(yCenters(1,1) - ycm1) > 1
    yCenters(1,1) = ycm1;
end
if abs(xCenters(1,2) - xcm2) > 1
    xCenters(1,2) = xcm2;
end
if abs(yCenters(1,2) - ycm2) > 1
    yCenters(1,2) = ycm2;
end

 
for i = 2:size(xCenters,1)
    if abs(xCenters(i,1) - xCenters(i-1,1)) > 1
        xCenters(i,1) = xCenters(i-1,1);
    end
    if abs(xCenters(i,2) - xCenters(i-1,2)) > 1
        xCenters(i,2) = xCenters(i-1,2);
    end
    if abs(yCenters(i,1) - yCenters(i-1,1)) > 1
        yCenters(i,1) = yCenters(i-1,1);
    end
    if abs(yCenters(i,2) - yCenters(i-1,2)) > 1
        yCenters(i,2) = yCenters(i-1,2);
    end
end
