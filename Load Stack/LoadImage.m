function [im, bg, filename, pathname] = LoadImage(pathname, offset)
% function [im, bg, filename, pathname] = LoadImage(pathname)

if nargin < 1
    pathname = 'c:\';
end
if nargin < 2
    offset = 0;
end

[pathname, filename, ext] = fileparts(pathname);
if isempty(ext)
    [filename, pathname] = uigetfile('*.tif','Load Image',pathname);
end
bg = [];
if pathname == 0
    im = [];
    bg = [];
    filename = [];
    pathname = [];
    return;  
end

im = double(imread(fullfile(pathname, [filename ext]))) - offset;
im = im(2:end-1,:);

% ButtonName = questdlg('Subtract background?','Question');
% if strcmp(ButtonName,'Yes')
%     prompt={'Enter the exposure time'};
%     name='Input';
%     numlines=1;
%     defaultanswer={'330'};
%     answer=inputdlg(prompt,name,numlines,defaultanswer);
%     bg = FindBackground(str2double(answer{1}));
%     % set bg to correct size
%     % bg = bg(1:size(im,1),1:size(im,2));
%     im = im - bg;
% else
%     bg = [];
% end
% 

