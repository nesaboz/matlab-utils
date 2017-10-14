function varargout = LoadStackFromTo(pathname, extension, Nstart, Nlength, skipNumber)
% function varargout = LoadStackFromTo(pathname, extension, [Nstart, Nlength])
% varargout = [stack, pathname];
%
% N.B., 08/27/2008
% N.B., 10/01/2012
% N.B., 01/23/2013

if nargin < 2
    extension = 'tif';
end
if strcmp(extension, 'tif')
    [filename, pathname] = uigetfile('*.tif','Load random image', pathname);
end
if pathname == 0
    for i = 1:nargout
        varargout{i} = [];
    end
    return;
end

if ~strcmp(pathname(end), filesep)
    pathname = [pathname '\'];
end

fileStruct = LoadFilesFromFolderWithSkipping(pathname, extension, Nstart, Nlength, skipNumber);
stack = LoadStackFromStruct(pathname, fileStruct);

if (nargout == 1)
    varargout{1} = stack;
elseif nargout == 2
    varargout{1} = stack;
    varargout{2} = pathname;
end