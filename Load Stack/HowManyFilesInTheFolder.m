function counter = HowManyFilesInTheFolder(pathname, extension)
% function counter = HowManyFilesInTheFolder(pathname, extension)
%
% Counts how many files with specific extension are in the desired folder
folderStruct = dir(pathname);

counter = 0;
for i = 1:numel(folderStruct)
    if (folderStruct(i).isdir ~= 1) && (strcmp(GetExtension(folderStruct(i).name), extension) || strcmp(GetExtension(folderStruct(i).name), upper(extension)))
        counter = counter + 1;
    end
end