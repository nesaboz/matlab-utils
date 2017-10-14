function ExportGraphToEPS(myName)
% function ExportGraphToEPS(myName)
set(gcf, 'PaperPositionMode', 'auto');
print('-depsc2', myName);
print('-dtiffn', myName);
print('-djpeg', myName);
saveas(gcf, myName, 'fig')