% lets fit erf

asdf = fittype('A*erf(B*x-C)+D','coefficients',{'A','B','C','D'});
asdf2 = fit(X,Y,asdf);