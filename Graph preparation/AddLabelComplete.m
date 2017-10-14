% complete function how to add a label to a image
% usage: evaluate cell by cell

clc;
[im, pathname] = LoadImage(pathname);

%%
Shim(im);
% Place the following line after createing the figure but before ploting
% axes1 = axes('Parent',figure1,'FontSize',14);
[x,y] = ginput(1);

%% 
close all
str = 'f)';
fontsize = 62;
Shim(im);
AddLabel(x(1), y(1), str, fontsize);
% usage: maximize the window, then use 
