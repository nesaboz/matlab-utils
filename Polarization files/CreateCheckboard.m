function x = CreateCheckboard(N,R)
% function x = CreateCheckboard(N,R)
% N is scalar.
% R stands for radius
if mod(N,2) == 0
    x0 = N/2 + 1;
    y0 = N/2 + 1;
else
    x0 = (N+1)/2;
    y0 = (N+1)/2;
    % error('Enter odd N');
end

x = zeros(N);
x(x0,y0 + R) = 1;
x(x0,y0 - R) = 1;
x(x0 + R,y0) = 1;
x(x0 - R,y0) = 1;
x(x0 + round(R/sqrt(2)),y0 + round(R/sqrt(2))) = 1;
x(x0 - round(R/sqrt(2)),y0 + round(R/sqrt(2))) = 1;
x(x0 + round(R/sqrt(2)),y0 - round(R/sqrt(2))) = 1;
x(x0 - round(R/sqrt(2)),y0 - round(R/sqrt(2))) = 1;
