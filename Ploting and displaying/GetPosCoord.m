function a = GetPosCoord(n)
figure;
s = get(0,'Screensize');

sx = s(3);
sy = s(4);
m = min(sx/2,sy/2 -75);
if (n==1);
    a = [0 sy/2 m m];
end
if (n==2);
    a = [0 0 m m];
end
if (n==3);
    a = [sx/2 sy/2 m m];
end
if (n==4);
    a = [sx/2 0 m m];
end

if (n==5);
    a = [sx sy/2 m m];
end
if (n==6);
    a = [sx 0 m m];
end
if (n==7);
    a = [sx+sx/2 sy/2 m m];
end
if (n==8);
    a = [sx+sx/2 0 m m];
end
close;
