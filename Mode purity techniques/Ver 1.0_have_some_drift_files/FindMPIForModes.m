function MPI_S2 = FindMPIForModes(IA, IB)

% 1) S^2 (or C^2 method)
MPI_S2 = 10*log10(sum(IA(:))./sum(IB(:)));
% disp(['MPI_S^2 = ' num2str(MPI_S2)]);

