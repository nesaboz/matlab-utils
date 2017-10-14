function b = Crop(a)
Shim(a);
[xl,yl] = ginput(2);
close;
b = a(round(min(yl):max(yl)),round(min(xl):max(xl)));
Shim(b);