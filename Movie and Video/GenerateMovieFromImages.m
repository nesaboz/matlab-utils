function F = GenerateMovieFromImages(ME, ylimits, z)
% function F = GenerateMovie(ME, ylimits)
% F is the output, ME is the cube of images
if nargin < 2
    ylimits = [min(ME(:)), max(ME(:))]; 
end
if nargin < 3
    z = 1:50;
end

loops = size(ME,3);
Pos(1)
hold on
F(loops) = struct('cdata',[],'colormap',[]);
for j = 1:loops
    
    imagesc(ME(:,:,j));
    
    colormap(gray); 
    axis off image; 
    colorbar;
    
    xlabel('Pens (not ordered)')
    ylabel('Count error');
    title(['Z = ' num2str(z(j)) ' \mum'])
    drawnow
    F(j) = getframe(gcf);
    
end