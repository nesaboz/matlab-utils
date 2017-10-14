function putFTnl(X,r,k)
%function put(image,'title',position);

put((abs(fftshift(fft2(fftshift(X))))),r,k);
%zoom(6);
%imdistline;