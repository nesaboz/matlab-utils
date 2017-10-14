function ExportGraph(myName, myFolder)
% function ExportGraph(myName, myFolder)

if nargin < 2
    set(gcf, 'PaperPositionMode', 'auto');
    print('-depsc2', myName);
    print('-dtiffn', myName);
    print('-djpeg', myName);
    %print('-dmeta', myName);
    saveas(gcf, myName, 'fig')
else
    set(gcf, 'PaperPositionMode', 'auto');
    print('-depsc2', fullfile(cd, myFolder, myName));
    print('-dtiffn', fullfile(cd, myFolder, myName));
    print('-djpeg', fullfile(cd, myFolder, myName));
    % print('-dmeta', fullfile(cd, myFolder, myName));
    saveas(gcf, fullfile(myFolder, myName), 'fig')
end
    