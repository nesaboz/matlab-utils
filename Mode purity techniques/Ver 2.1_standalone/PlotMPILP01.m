switch wavelengthOrTime,
    case 'Wavelength',
        
        Pos(1)
        hold on
        plot(lambda, MPI.a)
        plot(lambda, MPI.b,'g')
        legend('LP01','others')
        hold off
        temp = ParsePathname(pathname);
        title(['MPI - ' temp{end}]);
        
        PrepareGraphWithLegendNE(2)
        
        
        %         Pos(1)
        %         hold on
        %         plot(lambda, MPI.a1)
        %         plot(lambda, MPI.b1,'g')
        %         hold off
        %         legend('V^{+}_{11}','other^{+}')
        %         xlabel('Wavelength (nm)');
        %         ylabel('Mode power contribution (dB)');
        %         temp = ParsePathname(pathname);
        %         title(['MPI - ' temp{end}]);
        %         PrepareGraphWithLegendNE(1)
        %
        %         Pos(2)
        %         hold on
        %         plot(lambda, MPI.a2,'r')
        %         plot(lambda, MPI.b2,'g')
        %         hold off
        %         legend('V^{-}_{11}','other^{-}')
        %         xlabel('Wavelength (nm)');
        %         ylabel('Mode power contribution (dB)');
        %         temp = ParsePathname(pathname);
        %         title(['MPI - ' temp{end}]);
        %         PrepareGraphWithLegendNE(2)
        %
        
        
    case 'Time',
        
        Pos(1)
        hold on
        plot(timing/60, MPI.a1)
        plot(timing/60, MPI.a2,'r')
        plot(timing/60, MPI.b1,'g')
        plot(timing/60, MPI.b2,'m')
        
        legend('V^{+}_{11}','other^{+}','V^{-}_{11}','other^{-}')
        xlabel('Time (min)');
        ylabel('Mode power contribution (dB)');
        temp = ParsePathname(pathname);
        title(['MPI - ' temp{end}]);
        PrepareGraphWithLegendNE
        hold off
end % switch

