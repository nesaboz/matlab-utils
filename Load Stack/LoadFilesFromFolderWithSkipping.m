function fileStruct = LoadFilesFromFolderWithSkipping(pathname, extension, Nstart, Nlength, skipNumber)
% function fileStruct = LoadTiffsFromFolder(pathname, Nstart, Nlength)
%
% Self-explanatory.
%
% N.Bozinovic 08/27/08
folderStruct = dir(pathname);
counter = HowManyFilesInTheFolder(pathname, extension);

if Nstart + Nlength - 1 > counter
    msgbox(['There are only ' num2str(counter,'%03g') ' ' extension ' images in the folder.            .']);
    return;
end
index = 0;
i = 1;
fileCounter = 0;
bool = 1;
h = waitbar(0,'Please wait...');
while bool && (i <= length(folderStruct))
    waitbar(i/length(folderStruct),h)
    if (folderStruct(i).isdir ~= 1) && (strcmp(GetExtension(folderStruct(i).name), extension) || strcmp(GetExtension(folderStruct(i).name), upper(extension))) 
        fileCounter = fileCounter + 1;
        if (fileCounter >= Nstart) && (mod(fileCounter,skipNumber) == 0)
            index = index + 1;
            fileStruct(index) = folderStruct(i);
        end
        if index >= Nlength
            bool = 0;
        end
    end
    i = i + 1;
end
close(h)