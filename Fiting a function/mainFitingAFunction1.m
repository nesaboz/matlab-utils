clc;
close all
powerRatioDbTEAll = zeros(1,9);
powerRatioDbHE11All = zeros(1,9);
l = [563, 450, 337, 225, 112, 56, 27.5, 7.2, 1];
chooseMode = 1;  % 1 for H21odd, 0 for vortex
Pos(2);
Pos(3);
Pos(4);
for chooseLength = 1:9
    if chooseMode
        eval(['load L' num2str(chooseLength) '_HE21odd']);
    else
        if chooseLength == 7
            chooseLength = 6;
        end
        eval(['load L' num2str(chooseLength) '_vortex']);
    end
        
    f = fittype('a1 + a2*sind(x + a3) + a4*sind(2*x + a5)', ...
        'coefficients',{'a1','a2','a3','a4','a5'}); % , 'options',s);
    A = zeros(5,72);
    x = theta;
 
    
    for i = 1:72
        y = ringProfiles(:,i);
        [FO,gof,output] = fit(x, y, f,'Startpoint',[1400 500 0 500 0]);
        A(:,i) = abs([FO.a1 FO.a2 FO.a3 FO.a4 FO.a5]);
%             figure(1);
%             plot(x, y, x, FO(x));
%             figure(2);
%             stem(A(2,:))
%             title('C1')
%             axis([0 72 0 4095])
%             figure(3);
%             stem(A(4,:))
%             title('C2')
%             axis([0 72 0 4095])
%             pause
    end
    %%
    
%     close all
%     Pos(1);
%     plot(A(1,:))
%     axis([0 72 0 4095])
    % hold on
    % plot(ringProfiles(:,1),'r')
    
    
    Pos(1);
    plot(A(2,:))
    axis([0 72 0 2000])
    Pos(2);
    plot(mod(A(3,:),360))
    Pos(3);
    plot(A(4,:))
    axis([0 72 0 2000])
    Pos(4);
    plot(mod(A(5,:),360))

    powerRatioDbHE11All(chooseLength) = mean(A(2,:));
    powerRatioDbTEAll(chooseLength) = mean(A(4,:));
   pause
end

close all
Pos(1)
plot(l, powerRatioDbHE11All);
Pos(2)
plot(l, powerRatioDbTEAll);

