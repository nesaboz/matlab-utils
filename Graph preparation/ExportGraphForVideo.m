function ExportGraphForVideo(myName, myFolder)
% function ExportGraph(myName, myFolder)

set(gcf, 'PaperPositionMode', 'auto');
if nargin < 2
    print('-djpeg', myName);
else
    print('-djpeg', fullfile(cd, myFolder, myName));
end
    