% print answer to file
% load answer

fid = fopen('pera.txt','w');
for i = 1:size(answer,1)
    temp1 = answer(i,1);
    temp2 = answer(i,2);
    temp3 = answer(i,3);
    
    fprintf(fid, '%s, %s, %s \n', temp1{1}, temp2{1}{1}, temp3{1}{1});
end
fclose(fid)

