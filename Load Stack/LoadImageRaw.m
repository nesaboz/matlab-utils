function [im, filename, pathname] = LoadImageRaw(pathname)
% function [im, filename, pathname] = LoadImageRaw(pathname)

if nargin < 1
    pathname = 'c:\';
end
[pathname, filename, ext] = fileparts(pathname);
if isempty(ext)
    [filename, pathname] = uigetfile('*.tif','Load Image',pathname);
end

if pathname == 0
    im = [];
    bg = [];
    filename = [];
    pathname = [];
    return;  
end

im = double(imread(fullfile(pathname, [filename ext]))) - 2^15;
im = im(2:end-1,:);



