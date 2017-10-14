function PlotMPI(x, MPI, str)

%% plot MPI
Pos(2)
hold on
plot(x, MPI(:,1))
plot(x, MPI(:,2),'r')
plot(x, MPI(:,3),'g')
plot(x, MPI(:,4),'m')
plot(x, MPI(:,5),'k')

if x(1) ~= 0 
    xlabel('Wavelength (nm)');
else
    xlabel('Time (s)');
end
ylabel('Mode power contribution (dB)');
legend('V_{21}','V_{T}','V_{11}','V_{31}','other')

if nargin < 3
    str = '';
end

title(['Recovered vales for MPI for ' str])
PrepareGraphWithLegendNE
hold off;