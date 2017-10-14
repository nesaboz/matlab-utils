function [fittedArray, fitStruct] = FitFunction(xArray, yArray)
% function [fittedArray, fitStruct] = FitFunction(xArray, yArray)
% N.B. 01/2012

myFitType = fittype('a*x^2 + b* x + c');
options = fitoptions('Method','NonlinearLeastSquares','MaxFunEvals',1500);
fitStruct = fit(xArray, yArray, myFitType, options);
fittedArray = fitStruct(xArray);


