function SaveMovieToFileFunction(myMovie, name, rate)
% function SaveMovieToFileFunction(myMovie, name, rate)

v = VideoWriter(name);
v.FrameRate = rate;
open(v)
writeVideo(v, myMovie)
close(v)
