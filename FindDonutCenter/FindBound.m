function [boundUp, boundDown] = FindBound(fun, per)
% function bound = FindBound(fun, per)
% Finds the bound of a periodic function, so that
% desired number of standard deviations (denoted by per),
% are within the bound.
% NB 05/11

middle = mean(fun);
boundUp = middle + per*std(fun);
boundDown = middle - per*std(fun);

% % old approach
% ma = max(fun);
% mi = min(fun);
% middle = median(fun);
% m = 3*std(fun);
% 
% N = length(fun);
% % counter = 0;
% bool = 1;
% bound = m;
% while bool
%     s = 0;
%     for i = 1:N
%         if abs(fun(i) - middle) < bound 
%             s = s + 1;
%         end
%     end
%     if s > per*N
%         bound = bound - step;
%         % counter = counter + 1
%     else
%         bool = 0;
%     end
% end
% boundUp = middle + bound;
% boundDown = middle - bound;