function  stack = LoadStackFromStruct16Bit(pathname, fileStruct, rect)
% function  stack = LoadStackFromStruct(pathname, fileStruct, rect)
% loads the files into the 'stack' from 'fileStruct'
%
% N.Bozinovic, 08/27/08

extension = GetExtension(fileStruct(1).name);
h = waitbar(0,'Please wait...');
switch lower(extension)
    case 'tif'
        if nargin < 3
            rect = size(imread([pathname fileStruct(1).name]));
            rect = [ 1 1 rect(1:2)];
        end
        
        N(1) = rect(3) - rect(1) + 1; % imagesize in one dimension
        N(2) = rect(4) - rect(2) + 1;
        N(3) = length(fileStruct);        
        
        for i = 1 : N(3)
            waitbar(i/N(3),h)
            temp = double(imread([pathname fileStruct(i).name]));
            stack(i).data = temp(rect(1):rect(3),rect(2):rect(4));
            stack(i).name = fileStruct(i).name;
        end
    case 'csv'
        data = csvread([pathname fileStruct(1).name]);
        N = size(data);
        N(3) = length(fileStruct);
        for i = 1 : N(3)
            waitbar(i/N(3),h)
            data = csvread([pathname fileStruct(i).name]);
            stack(i).x = data(:,1);
            stack(i).y = data(:,2);
            stack(i).name = fileStruct(i).name;
        end
     case 'txt'
        for i = 1:numel(fileStruct)
            waitbar(i/numel(fileStruct),h)
            fid = fopen([pathname fileStruct(i).name]);
            j = 0;
            while 1
                
                j = 1;
                stack(j).x
                tline = fgets(fid);
                if ~ischar(tline), break, end
                temp = str2num(tline);
                
                stack(j).x(j) = temp(1);
                stack(j).y(j) = temp(2);
                stack(j).name = fileStruct(i).name;
            end
            fclose(fid)
        end
end
close(h)
