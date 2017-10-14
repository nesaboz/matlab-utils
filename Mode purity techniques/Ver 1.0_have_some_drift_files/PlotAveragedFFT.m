s = shiftdim(sum(sum(abs(fftCubePol1),1),2));
s(1) = sum(Idc1(:));
s1 = 10*log10(s/s(1));
s = shiftdim(sum(sum(abs(fftCubePol2),1),2));
s(1) = sum(Idc2(:));
s2 = 10*log10(s/s(1));

lambdaStep = (lambda(2) - lambda(1));
deltaNg = (0:1:M(3)-1)*(lambda(1)^2)/(lambdaStep *(L*1e9)*M(3));
Pos(4)
plot(deltaNg(1:round(end/2)),s1(1:round(end/2)));
plot(deltaNg(1:round(end/2)),s2(1:round(end/2)));
xlabel('\Delta n_{g}');
ylabel('Normalized |FFT|')
title(['|FFT| averaged over all pixels. ' ID ', L \approx ' num2str(L) ' m']);