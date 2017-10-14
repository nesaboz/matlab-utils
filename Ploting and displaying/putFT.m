function putFT(X,r,k)
%function put(image,'title',position);

puts(log(abs(fftshift(fft2(X)))),r,k);
%zoom(6);
%imdistline;