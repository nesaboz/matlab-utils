function E = AddModes(varargin)
if nargin == 3
    Mode1 = varargin{1};
    Mode2 = varargin{2};
    str = varargin{3};
    E1 = Mode1.x;
    E2 = Mode2.x;
    eval([' E.x = ' str ';'])
    E1 = Mode1.y;
    E2 = Mode2.y;
    eval([' E.y = ' str ';'])
    E.abs = sqrt(E.x.^2 + E.y.^2);
end
if nargin == 4
    Mode1 = varargin{1};
    Mode2 = varargin{2};
    Mode3 = varargin{3};
    str = varargin{4};
    E1 = Mode1.x;
    E2 = Mode2.x;
    E3 = Mode3.x;
    eval([' E.x = ' str ';'])
    E1 = Mode1.y;
    E2 = Mode2.y;
    E3 = Mode3.y;
    eval([' E.y = ' str ';'])
    E.abs = sqrt(abs(E.x).^2 + abs(E.y).^2);
end
% Shim(E.abs.^2,1,'Intensity');