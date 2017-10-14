function PlotRingMPI(x, MPI, str)

%% plot MPI
Pos(2)
plot(x, MPI.a1)
hold on
plot(x, MPI.a2,'r')
plot(x, MPI.b,'g')
plot(x, MPI.c,'m')
% legend('OAM^{+}','OAM^{-}', 'TE+TM','HE_{11}^{x+y}')
legend('OAM^{+}','OAM^{-}', 'V_T','V_{11}')

% plot(MPIth.a1)
% plot(MPIth.a2,'r')
% plot(MPIth.b,'g')
% plot(MPIth.c,'m')

%legend('OAM^{+}','OAM^{-}', 'TE+TM','HE_{11}^{x+y}')
%legend('OAM^{+}','OAM^{-}', 'TE+TM','HE_{11}^{x+y}', 'OAM^{+} th','OAM^{-} th', 'TE+TM th','HE_{11}^{x+y} th')

ylabel('Mode power contribution (dB)');
if x(1) ~= 0 
    xlabel('Wavelength (nm)');
else
    xlabel('Time (s)');
end

if nargin < 3
    str = '';
end

title(['Recovered vales for MPI for ' str])
PrepareGraphWithLegendNE
hold off;
xlim([x(1), x(end)]);