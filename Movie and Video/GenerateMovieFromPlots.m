function F = GenerateMovieFromPlots(ME, ylimits, z)
% function F = GenerateMovie(ME, ylimits)
% F is the output, ME is the matrix of plots
if nargin < 2
    ylimits = [min(ME(:)), max(ME(:))]; 
end
if nargin < 3
    z = 1:50;
end

loops = size(ME,2);
F(loops) = struct('cdata',[],'colormap',[]);
for j = 1:loops
    plot(ME(:,j));
    grid on
    xlabel('cross section of sobel')
    PrepareGraphWithoutLegend
    xlim([1 size(ME,1)])
    xticks([])
    ylabel('Count error');
    title(['Z = ' num2str(z(j)) ' \mum'])
    ylim(ylimits)
    drawnow
    F(j) = getframe(gcf);
    
end