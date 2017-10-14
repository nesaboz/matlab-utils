function PosThird(n)
figure;
s = get(0,'Screensize');
sx = s(3);
sy = s(4);
L = 3;
d = 50;
if (n==1);
    set(gcf,'Position',round([0, d+(sy-d)/2, sx/3, (sy-d)/2]));
end
if (n==2);
    set(gcf,'Position',round([sx/3, d+(sy-d)/2, sx/3, (sy-d)/2]));
    
end
if (n==3);
    set(gcf,'Position',round([2*sx/3, d+(sy-d)/2, sx/3, (sy-d)/2]));
end
if (n==4);
    set(gcf,'Position',round([0, d, sx/3, (sy-d)/2]));
end
if (n==5);
    set(gcf,'Position',round([sx/3, d, sx/3, (sy-d)/2]));
end
if (n==6);
    set(gcf,'Position',round([2*sx/3, d, sx/3, (sy-d)/2]));
end
