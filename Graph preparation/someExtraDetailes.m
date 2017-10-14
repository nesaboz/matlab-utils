%% NOTE!!! This code will not work if the legend command has been issued
%% before

% title('dk110127OD100, L_{g}=40mm','Interpreter','Tex')

%legend toggle

h = gcf;
h1 = get(h,'Children');
set(h,'Color',[1 1 1])

% input
myLetterSize = 24;
myAxisNumberSize = 16;
myLineWidth = 2;

%% adjust letters on axes and title
xName = get(h1,'xlabel');
set(xName,'FontSize',myLetterSize);
yName = get(h1,'ylabel');
set(yName,'FontSize',myLetterSize);
titleName = get(h1,'title');
set(titleName,'FontSize',myLetterSize);
%% set up the box
box(h1,'on');
%% adjust the data lines
h2 = get(h1,'Children');
for i = 1:numel(h2)
    set(h2(i),'LineWidth',myLineWidth)
end
% adjust the axis lines and numbers
set(h1,'FontSize',myAxisNumberSize)
set(h1,'LineWidth',myLineWidth)
set(h1,'LineWidth',myLineWidth)
%yTL = (get(h1,'YTickLabel'));
%set(h1,'YTickLabel',stryTL(1:2:end));
%% legend
% legend('Original','Adjusted')
% legend('TE','HE_{21}','TM','TE exp.','HE_{21} exp.','TM exp.', 'Location', 'SouthEast');
% title('HE_{21} microbend resonance for different polarizations','FontSize',myLetterSize)
% legend('HE_{11}','TE','HE_{21}','TM');
% 'Location', 'SouthEast');
%title('\Delta n_{eff} (regarding HE_{11}) for original profile')
% legend('Pol1','Pol2','Pol3','Pol4','Pol5','Pol6','Pol7','Pol8','Pol9','Location', 'SouthEast');
%%
% title('Adjusting index profile')
% title('Half-wave and quarter-wave plate rotation')
% title('Role of fiber angle')
% legend('\alpha = 0^{o}', '\alpha = 0^{o}', '\alpha = 45^{o}','\alpha = 45^{o}','\alpha = 90^{o}','\alpha = 90^{o}')
%legend('HE^{odd}_{21}, L = 100mm', 'HE^{even}_{21}, L = 100mm', ...
%    'HE^{odd}_{21}, L = 20mm', 'HE^{even}_{21}, L = 20mm', ...
%    'HE^{odd}_{21}, L = 40mm', 'HE^{even}_{21}, L = 40mm');
% legend('HE^{even}_{21}, \alpha = 0^{o}', 'HE^{odd}_{21}, \alpha = 0^{o}', ...
%     'HE^{even}_{21}, \alpha = 45^{o}', 'HE^{odd}_{21}, \alpha = 45^{o}', ...
%     'HE^{even}_{21}, \alpha = 90^{o}', 'HE^{odd}_{21}, \alpha = 90^{o}');


% 45^{o}','\alpha = 90^{o}','\alpha = 90^{o}')

 
% legend('OSA','Low pass', 'Fit');


%legend toggle