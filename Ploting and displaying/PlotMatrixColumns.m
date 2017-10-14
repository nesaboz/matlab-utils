function PlotMatrixColumns(mat)

for i = 1:size(mat,2)
    mat(:,i) = mat(:,i)/max(mat(:,i));
end
plot(mat)