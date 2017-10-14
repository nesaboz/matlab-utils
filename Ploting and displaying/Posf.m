function h = Posf(n)
h = figure;
s = get(0,'Screensize');
sx = s(3);
sy = s(4);

if (n==1);
    set(gcf,'Position',[10 40 1250 900]);
end

if (n==2);
    set(gcf,'Position',[sx + 10 40 1250 900]);
end
