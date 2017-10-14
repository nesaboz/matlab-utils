function [Idc1, Idc2, Idc3, Idc4] = FindIdc(cubePol1, cubePol2, cubePol3, cubePol4) 

Idc1 = mean(cubePol1,3);
Idc2 = mean(cubePol2,3);
Idc3 = mean(cubePol3,3);
Idc4 = mean(cubePol4,3);