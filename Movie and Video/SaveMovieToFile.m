clc;
fft_im = rand(30, 30, 20);
myVideo = VideoWriter('fft3.avi');
myVideo.FrameRate = 10;
open(myVideo);

myMax = max(fft_im(:));
for i = 1:size(fft_im,3)
    writeVideo(myVideo, fft_im(:,:,i)./myMax);
end

close(myVideo)

% 
% 
% % Prepare the new file.
% vidObj = VideoWriter('peaks.avi');
% open(vidObj);
% 
% % Create an animation.
% Z = peaks; surf(Z);
% axis tight
% set(gca,'nextplot','replacechildren');
% 
% for k = 1:20
%    surf(sin(2*pi*k/20)*Z,Z)
% 
%    % Write each frame to the file.
%    currFrame = getframe;
%    writeVideo(vidObj,currFrame);
% end
% 
% % Close the file.
% close(vidObj);