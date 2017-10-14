
%% with nice error bars
Pos(1)
hold on
myColor{1} = [1 0 0];
myColor{2} = [0 1 0];
myColor{3} = [0 0 1];
for i = 1:3
    errorbar(Larray, 10*log10(modePuritiesMean(:,i)), ...
        10*log10(modePuritiesMean(:,i)) - 10*log10(modePuritiesMean(:,i) - modePuritiesStDev(:,i)), ...
        10*log10(modePuritiesMean(:,i)) - 10*log10(modePuritiesMean(:,i) + modePuritiesStDev(:,i)),'Color',myColor{i});
end

xlabel('Fiber length (m)')
ylabel('MPI (dB)');
title('Cutback for dk11Od115, \lambda \approx 1500nm');
legend('V_{21}', 'V_{T}', 'V_{11}','V_{31}','V_{41}','V_{51}');
PrepareGraphWithLegendNE
PosTo(2)
