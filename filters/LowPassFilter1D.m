function fil = LowPassFilter1D(N,kg,delta)
% function fil = LowPassFilter1D(N,kg,delta);
%
% N is the size of the matrix
% kg is the cutoff
% delta is the roll off
%
% N.Bozinovic, 12/08/08


k = (1:N)';
kg = round(kg);
delta = round(delta);
left = kg-min(kg,delta);
right = kg + min(N-kg,delta);
if left ~= 0 
    fil(1:left) = 1;
end
fil(left+1:right) = 1/2*(1-sin(pi*(k(left+1:right)-kg)/2/delta));
fil(right+1:N) = 0;

% plot(k,fil);
% line([kg kg],[min(fil) max(fil)*1],'LineStyle','--');
% line([kg+delta kg+delta],[min(fil) max(fil)*1.1],'LineStyle','--');
% line([kg-delta kg-delta],[min(fil) max(fil)*1.1],'LineStyle','--');
% title('Low pass')