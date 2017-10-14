function PosTo(n)
s = get(0,'Screensize');
sx = s(3);
sy = s(4);

% one time test to shrink the figure size
% sx = sx/2;
% sy = sx/2;

sx1 = 1680;
sy1 = 1050;

rx = s(3)/2;
ry = s(4)/2;


D = 100;
if (n==-1)
    set(gcf,'Position',[-rx ry/2+D rx/2 ry/2 - 75]);
end
if (n==-3)
    set(gcf,'Position',[-rx, D, rx/2, ry/2-75]);
end
if (n==-2)
    set(gcf,'Position',[-rx/2 ry/2+D rx/2 ry/2-75]);
end
if (n==-4)
    set(gcf,'Position',[-rx/2 D rx/2 ry/2-75]);
end

if (n==1)
    set(gcf,'Position',[0 sy/2 sx/2 sy/2 - 75]);
end
if (n==3)
    set(gcf,'Position',[0 0 sx/2 sy/2-75]);
end
if (n==2)
    set(gcf,'Position',[sx/2 sy/2 sx/2 sy/2-75]);
end
if (n==4)
    set(gcf,'Position',[sx/2 0 sx/2 sy/2-75]);
end

dx = 1;
dy = 70;

width = sx1/2-dx;
height = sy1/2-dy;

if (n==5)
    set(gcf,'Position',[sx, sy/2, width, height]);
end
if (n==7)
    set(gcf,'Position',[sx, 0, width, height]);
end
if (n==6)
    set(gcf,'Position',[sx+sx1/2, sy/2, width, height]);
end
if (n==8)
    set(gcf,'Position',[sx+sx1/2, 0, width, height]);
end


if (n==20)
    set(gcf,'Position',[0, 0, (2*width), (2*height)]);
end
