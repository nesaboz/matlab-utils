function varargout = FindIdc(varargin) 
for i = 1:nargin
    varargout{i} = mean(varargin{i},3);
end
