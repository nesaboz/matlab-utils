function varargout = LoadStackAuto(pathname, extension, skipNumber)
% function varargout = LoadStack(varargin)
% varargin = (pathname, rect, Nstart, Nlength);
% varargout = [stack, pathname];
%
% N.Bozinovic, 08/27/08

if nargin < 3
    skipNumber = 1;
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
Nstart = 1;
Nlength = HowManyFilesInTheFolder(pathname, extension);  

fileStruct = LoadFilesFromFolderWithSkipping(pathname, extension, Nstart, Nlength, skipNumber);
stack = LoadStackFromStruct(pathname, fileStruct);

if (nargout == 1)
    varargout{1} = stack;
elseif nargout == 2
    varargout{1} = stack;
    varargout{2} = pathname;
end