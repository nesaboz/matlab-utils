function [fittedArray, fitStruct] = FitLinear(xArray, yArray)
% function [fittedArray, fitStruct] = FitLinear(xArray, yArray)
% N.B. 01/2012

myFitType = fittype('b* x + c');
options = fitoptions('Method','NonlinearLeastSquares','MaxFunEvals',1500);
fitStruct = fit(xArray, yArray, myFitType, options);
fittedArray = fitStruct(xArray);


