function PosToSmall(n)
set(gcf,'Position',[(mod((n-1), 25))*100, 1100 - (floor((n-1)/25))*375 - 50, 100, 300]);
