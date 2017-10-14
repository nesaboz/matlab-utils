switch wavelengthOrTime,
    case 'Wavelength',
        
        Pos(1)
        hold on
%         plot(lambda, MPI.a1)
%         plot(lambda, MPI.a2,'r')
         plot(lambda, MPI.a,'r')
        plot(lambda, MPI.b,'g')
        plot(lambda, MPI.c,'b')
        % legend('OAM^{+}','OAM^{-}', 'parasitic','LP_{01}')
        legend('OAM', 'TE + TM','LP_{01}')
        hold off
        temp = ParsePathname(pathname);
        title(['MPI - ' temp{end}]);
        xlabel('Wavelength (nm)');
        ylabel('Mode power contribution (dB)');
        
        PrepareGraphWithLegendNE(2)
        
        
        %         Pos(1)
        %         hold on
        %         plot(lambda, MPI.a1)
        %         plot(lambda, MPI.b1,'g')
        %         plot(lambda, MPI.c1,'m')
        %         hold off
        %         legend('V^{+}_{21}','V^{+}_{T}','V^{+}_{11}')
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
        %         plot(lambda, MPI.c2,'m')
        %         hold off
        %         legend('V^{-}_{21}','V^{-}_{T}','V^{-}_{11}')
        %         xlabel('Wavelength (nm)');
        %         ylabel('Mode power contribution (dB)');
        %         temp = ParsePathname(pathname);
        %         title(['MPI - ' temp{end}]);
        %         PrepareGraphWithLegendNE(2)
        
        
        
    case 'Time',
        
        Pos(1)
        hold on
        
        x = timing/60;
        % index1 = find(x>=252,1);
        % index2 = find(x>=342,1);
        index1 = 1;
        index2 = length(timing);
       
        plot(x(index1:index2) - x(index1), MPI.a1(index1:index2))
        plot(x(index1:index2) - x(index1), MPI.a2(index1:index2),'r')
        plot(x(index1:index2) - x(index1), MPI.b(index1:index2),'g')
        plot(x(index1:index2) - x(index1), MPI.c(index1:index2),'m')
        
        legend('OAM^{+}','OAM^{-}', 'parasitic','LP_{01}')
        xlabel('Time (min)');
        ylabel('Mode power contribution (dB)');
        temp = ParsePathname(pathname);
        title(['MPI - ' temp{end}],'Interpreter','none');
        PrepareGraphWithLegendNE
        hold off
end % switch

