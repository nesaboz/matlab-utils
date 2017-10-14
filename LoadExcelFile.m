function [fullFilename, RAW, shortName] = LoadExcelFile(pathname)
% [fullFilename, RAW, shortName] = LoadExcelFile

if (nargin == 1)
    if isdir(pathname)
        [filename, pathname, FILTERINDEX] = uigetfile({'*.mat;*.xlsx;', '(*.xlsx, *.mat)'; ...
            '*.mat','MAT-files (*.mat)'; '*.xlsx','Excel (*.xlsx)';}, 'Pick a file', pathname);
    else
        [pathname,NAME,EXT] = fileparts(pathname);
        filename = [NAME, EXT];
    end
else
    [filename, pathname, FILTERINDEX] = uigetfile({'*.mat;*.xlsx;', '(*.xlsx, *.mat)'; ...
        '*.mat','MAT-files (*.mat)'; ...
        '*.xlsx','Excel (*.xlsx)';}, 'Pick a file','Default');
end    

% textscan on csv-s is a NIGHTMARE to work with. So I read excel.
%% pick excel file
if filename == 0
    disp('Aborted loading, analyzing and publishing');
    return
end

disp(['Loading data: ' filename ' ...']);

fullFilename = fullfile(pathname, filename);

% read excel file
[~, ~, RAW] = xlsread(fullFilename);
% remove header as well as extra rows if there are some
[~,shortName, ext] = fileparts(filename);

disp('Loaded excel file');