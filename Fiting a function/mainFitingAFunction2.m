clc;
close all

l = [563, 450, 337, 225, 112, 56, 27.5, 7.2, 1];
chooseMode = 1;  % 1 for H21odd, 0 for vortex
for chooseLength = 1:1
    if chooseMode
        eval(['load L' num2str(chooseLength) '_HE21odd']);
    else
        if chooseLength == 7
            chooseLength = 6;
        end
        eval(['load L' num2str(chooseLength) '_vortex']);
    end
    
    f = fittype('a1 + a2*sind(x + a3) + a4*sind(2*x + a5)', ...
        'coefficients',{'a1','a2','a3','a4','a5'});
    M = size(ringProfiles,2);
    A = zeros(5,M);
    x = theta;
%     Pos(2);
%     Pos(3);
%     Pos(4);
    h = waitbar(0,'Please wait...');
    for i = 1:M
        waitbar(i/M,h)
        y = ringProfiles(:,i);
        [FO,gof,output] = fit(x, y, f,'Startpoint',[1400 500 0 500 0]);
        A(:,i) = abs([FO.a1 FO.a2 FO.a3 FO.a4 FO.a5]);
%         figure(1);
%         plot(x, y, x, FO(x));
%         % hold on
%         axis([0 360 0 4095])
%         figure(2);
%         stem(A(2,:))
%         title('C1')
%         axis([0 M 0 1500])
%         figure(3);
%         stem(A(4,:))
%         title('C2')
%         axis([0 M 0 1500])
%         pause
    end
    close(h)
    %%
    
%     % close all
%     Pos(1);
%     plot(A(2,:))
%     axis([0 M 0 1800])
%     Pos(2);
%     plot(mod(A(3,:),360))
%     Pos(3);
%     plot(A(4,:))
%     axis([0 M 0 1800])
%     Pos(4);
%     plot(mod(A(5,:),360))
    
    eval(['save L' num2str(chooseLength) '_HE21odd_A']);
end
