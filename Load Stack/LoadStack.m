function varargout = LoadStack(pathname, skipNumber)
% function varargout = LoadStack(varargin)
% varargin = (pathname, rect, Nstart, Nlength);
% varargout = [stack, pathname];
%
% N.Bozinovic, 08/27/08

if nargin < 2
    skipNumber = 1;
end
[filename, pathname] = uigetfile('*.tif;*.tiff','Load image from a stack', pathname);
extension = GetExtension(filename);

if pathname == 0
    for i = 1:nargout
        varargout{i} = [];
    end
    return;
end


if ~strcmp(pathname(end), filesep)
    pathname = [pathname '\'];
end
Nstart = 1;
Nlength = HowManyFilesInTheFolder(pathname, extension);  
% Nlength = 2000;
% if Nlength > 2000
%     Nlength = 1001;
%     Nstart = 1500;    
% end
% if Nlength > 1000
%     Nstart = 1;
%     Nlength = 1000;
% end

% fileStruct = LoadFilesFromFolder(pathname, extension, Nstart, Nlength);
fileStruct = LoadFilesFromFolderWithSkipping(pathname, extension, Nstart, Nlength, skipNumber);
stack = LoadStackFromStruct(pathname, fileStruct);

% if Nlength > counter
%         msgbox(textwrap({'There are not that many tiffs in the folder'},25));
%         return;
% end


if (nargout == 1)
    varargout{1} = stack;
elseif nargout == 2
    varargout{1} = stack;
    varargout{2} = pathname;
end