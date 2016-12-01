function uclAnalysisGraphAndSave
%%  uclDataAnalysisGraphAndSave
%  
%  Christopher Curran, East Carolina University
%  December 1st, 2016
%  
%  This function will display and save the plots selected by the user in 
%  uclAnalysisGraphingOptions

%  calling
%  --------
%  uclAnalysisGraphAndSave
%  
%  
%  inputs
%  --------
%   
%  
%  outputs
%  --------
%  
%  
%  other functions called
%  --------
%  uclAnalysisGraphingOptions
%  
%  
%  variables
%  --------
%  graphs2Plot          - numeric array depicting which graphs to show
%  graphs2Save          - numeric array depicting which graphs to save
%  uclBaseSessionAvgs   - Imaging session averages mat file for UCL BASE
%  uclNormSessionAvgs   - Imaging session averages mat file for UCL NORM
%  uclRelySessionAvgs   - Imaging session averages mat file for UCL RELY
%  uclTestSessionAvgs   - Imaging session averages mat file for UCL TEST
%  figureNames          - cell array containing strings for figure names
%  figureFileNames      - cell array containing strings for file names
%  barColors2           - color values for bar graphs with 2 bars/group
%  barColors4           - color values for bar graphs with 4 bars/group
%  groupLabels          - labels for each group of bars (usually imaging conditions)
%  barValues*           - values to be used in that particular graph
%  

%% Run uclAnaylsisGraphingOptions

%  User selects which graphs to plot and/or save
[graphs2Plot, graphs2Save] = uclAnalysisGraphingOptions();

%% Load SessionAvgs mat files

uclBaseSessionAvgs = load('uclBaseSessionAvgs.mat');
uclNormSessionAvgs = load('uclNormSessionAvgs.mat');
uclRelySessionAvgs = load('uclRelySessionAvgs.mat');
uclTestSessionAvgs = load('uclTestSessionAvgs.mat');



%% Create Variables of Strings for Figure names and File names

figureNames = {'UCL Length Across Studies';...
    'UCL Thickness Across Studies';...
    'UCL Space Across Studies';...
    'UH Gap Across Studies';...
    'UCL BASE Throwing vs Non-Throwing';...
    'UCL NORM Throwing vs Non-Throwing';...
    'UCL RELY Throwing vs Non-Throwing';...
    'UCL BASE Throughout Whole Season';...
    'UCL BASE Pre-Season vs UCL NORM';...
    'UCL RELY Day 1 vs Day 2'};

figureFileNames = {'UCL_Length_Across_Studies.tif';...
    'UCL_Thickness_Across_Studies.tif';...
    'UCL_Space_Across_Studies.tif';...
    'UH_Gap_Across_Studies.tif';...
    'UCL_BASE_Throwing_vs_Non-Throwing.tif';...
    'UCL_NORM_Throwing_vs_Non-Throwing.tif';...
    'UCL_RELY_Throwing_vs_Non-Throwing.tif';...
    'UCL_BASE_Throughout_Whole_Season.tif';...
    'UCL_BASE_Pre-Season_vs_UCL_NORM.tif';...
    'UCL_RELY_Day_1_vs_Day_2.tif'};


%% Color values for plots with 2 or 4 bars

% Matrix of purple and gold for colors of plots with 2 bars/condition
barColors2 = [89 42 138; 254 201 35]/255;

% Matrix of black, purple, gold, white for colors of plots with 4 bars/condition
barColors4 = [ 0 0 0; 89 42 138; 254 201 35; 255 255 255]/255;


%%
% Graphing Option 1
groupLabels = {'Supported','Foam-Unstressed','Foam-Stressed'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(1)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');
colormap(barColors4)

% Values to plot in top subplot
barValues1 = [nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,3),uclBaseSessionAvgs.('BaseGroupAvgs')(13,3)]) uclNormSessionAvgs.('NormGroupAvgs')(1,3) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,3),uclRelySessionAvgs.('RelyGroupAvgs')(3,3)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,3),uclTestSessionAvgs.('TestGroupAvgs')(3,3),uclTestSessionAvgs.('TestGroupAvgs')(5,3),uclTestSessionAvgs.('TestGroupAvgs')(7,3),uclTestSessionAvgs.('TestGroupAvgs')(9,3)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,9),uclBaseSessionAvgs.('BaseGroupAvgs')(13,9)]) uclNormSessionAvgs.('NormGroupAvgs')(1,9) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,9),uclRelySessionAvgs.('RelyGroupAvgs')(3,9)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,9),uclTestSessionAvgs.('TestGroupAvgs')(3,9),uclTestSessionAvgs.('TestGroupAvgs')(5,9),uclTestSessionAvgs.('TestGroupAvgs')(7,9),uclTestSessionAvgs.('TestGroupAvgs')(9,9)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,15),uclBaseSessionAvgs.('BaseGroupAvgs')(13,15)]) uclNormSessionAvgs.('NormGroupAvgs')(1,15) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,15),uclRelySessionAvgs.('RelyGroupAvgs')(3,15)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,15),uclTestSessionAvgs.('TestGroupAvgs')(3,15),uclTestSessionAvgs.('TestGroupAvgs')(5,15),uclTestSessionAvgs.('TestGroupAvgs')(7,15),uclTestSessionAvgs.('TestGroupAvgs')(9,15)])];

% Create top subplot of UCL Length in Throwing Arms
subplot(2,1,1)
bar(barValues1)
title('UCL Length - Throwing Arm')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 26])
legend('UCL BASE','UCL NORM','UCL RELY','UCL TEST','Location','eastoutside');

% Values to plot in bottom subplot
barValues2 = [nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,3),uclBaseSessionAvgs.('BaseGroupAvgs')(14,3)]) uclNormSessionAvgs.('NormGroupAvgs')(2,3) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,3),uclRelySessionAvgs.('RelyGroupAvgs')(4,3)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,3),uclTestSessionAvgs.('TestGroupAvgs')(4,3),uclTestSessionAvgs.('TestGroupAvgs')(6,3),uclTestSessionAvgs.('TestGroupAvgs')(8,3),uclTestSessionAvgs.('TestGroupAvgs')(10,3)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,9),uclBaseSessionAvgs.('BaseGroupAvgs')(14,9)]) uclNormSessionAvgs.('NormGroupAvgs')(2,9) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,9),uclRelySessionAvgs.('RelyGroupAvgs')(4,9)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,9),uclTestSessionAvgs.('TestGroupAvgs')(4,9),uclTestSessionAvgs.('TestGroupAvgs')(6,9),uclTestSessionAvgs.('TestGroupAvgs')(8,9),uclTestSessionAvgs.('TestGroupAvgs')(10,9)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,15),uclBaseSessionAvgs.('BaseGroupAvgs')(14,15)]) uclNormSessionAvgs.('NormGroupAvgs')(2,15) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,15),uclRelySessionAvgs.('RelyGroupAvgs')(4,15)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,15),uclTestSessionAvgs.('TestGroupAvgs')(4,15),uclTestSessionAvgs.('TestGroupAvgs')(6,15),uclTestSessionAvgs.('TestGroupAvgs')(8,15),uclTestSessionAvgs.('TestGroupAvgs')(10,15)])];

% Create bottom subplot of UCL Length in Non-Throwing Arms
subplot(2,1,2)
bar(barValues2)
title('UCL Length - NonThrowing Arm')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 26])
legend('UCL BASE','UCL NORM','UCL RELY','UCL TEST','Location','eastoutside');

% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(1),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(1),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(1))))
end



%%
% Graphing Option 2
groupLabels = {'Supported','Foam-Unstressed','Foam-Stressed'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(2)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');
colormap(barColors4)

% Values to plot in top subplot
barValues1 = [nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,4),uclBaseSessionAvgs.('BaseGroupAvgs')(13,4)]) uclNormSessionAvgs.('NormGroupAvgs')(1,4) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,4),uclRelySessionAvgs.('RelyGroupAvgs')(3,4)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,4),uclTestSessionAvgs.('TestGroupAvgs')(3,4),uclTestSessionAvgs.('TestGroupAvgs')(5,4),uclTestSessionAvgs.('TestGroupAvgs')(7,4),uclTestSessionAvgs.('TestGroupAvgs')(9,4)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,10),uclBaseSessionAvgs.('BaseGroupAvgs')(13,10)]) uclNormSessionAvgs.('NormGroupAvgs')(1,10) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,10),uclRelySessionAvgs.('RelyGroupAvgs')(3,10)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,10),uclTestSessionAvgs.('TestGroupAvgs')(3,10),uclTestSessionAvgs.('TestGroupAvgs')(5,10),uclTestSessionAvgs.('TestGroupAvgs')(7,10),uclTestSessionAvgs.('TestGroupAvgs')(9,10)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,16),uclBaseSessionAvgs.('BaseGroupAvgs')(13,16)]) uclNormSessionAvgs.('NormGroupAvgs')(1,16) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,16),uclRelySessionAvgs.('RelyGroupAvgs')(3,16)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,16),uclTestSessionAvgs.('TestGroupAvgs')(3,16),uclTestSessionAvgs.('TestGroupAvgs')(5,16),uclTestSessionAvgs.('TestGroupAvgs')(7,16),uclTestSessionAvgs.('TestGroupAvgs')(9,16)])];

% Create top subplot of UCL Thickness in Throwing Arms
subplot(2,1,1)
bar(barValues1)
title('UCL Thickness - Throwing Arm')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 2])
legend('UCL BASE','UCL NORM','UCL RELY','UCL TEST','Location','eastoutside');

% Values to plot in bottom subplot
barValues2 = [nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,4),uclBaseSessionAvgs.('BaseGroupAvgs')(14,4)]) uclNormSessionAvgs.('NormGroupAvgs')(2,4) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,4),uclRelySessionAvgs.('RelyGroupAvgs')(4,4)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,4),uclTestSessionAvgs.('TestGroupAvgs')(4,4),uclTestSessionAvgs.('TestGroupAvgs')(6,4),uclTestSessionAvgs.('TestGroupAvgs')(8,4),uclTestSessionAvgs.('TestGroupAvgs')(10,4)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,10),uclBaseSessionAvgs.('BaseGroupAvgs')(14,10)]) uclNormSessionAvgs.('NormGroupAvgs')(2,10) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,10),uclRelySessionAvgs.('RelyGroupAvgs')(4,10)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,10),uclTestSessionAvgs.('TestGroupAvgs')(4,10),uclTestSessionAvgs.('TestGroupAvgs')(6,10),uclTestSessionAvgs.('TestGroupAvgs')(8,10),uclTestSessionAvgs.('TestGroupAvgs')(10,10)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,16),uclBaseSessionAvgs.('BaseGroupAvgs')(14,16)]) uclNormSessionAvgs.('NormGroupAvgs')(2,16) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,16),uclRelySessionAvgs.('RelyGroupAvgs')(4,16)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,16),uclTestSessionAvgs.('TestGroupAvgs')(4,16),uclTestSessionAvgs.('TestGroupAvgs')(6,16),uclTestSessionAvgs.('TestGroupAvgs')(8,16),uclTestSessionAvgs.('TestGroupAvgs')(10,16)])];

% Create bottom subplot of UCL Thickness in Non-Throwing Arms
subplot(2,1,2)
bar(barValues2)
title('UCL Thickness - NonThrowing Arm')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 2])
legend('UCL BASE','UCL NORM','UCL RELY','UCL TEST','Location','eastoutside');

% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(2),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(2),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(2))))
end


%%
% Graphing Option 3
groupLabels = {'Supported','Foam-Unstressed','Foam-Stressed'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(3)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');
colormap(barColors4)

% Values to plot in top subplot
barValues1 = [nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,5),uclBaseSessionAvgs.('BaseGroupAvgs')(13,5)]) uclNormSessionAvgs.('NormGroupAvgs')(1,5) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,5),uclRelySessionAvgs.('RelyGroupAvgs')(3,5)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,5),uclTestSessionAvgs.('TestGroupAvgs')(3,5),uclTestSessionAvgs.('TestGroupAvgs')(5,5),uclTestSessionAvgs.('TestGroupAvgs')(7,5),uclTestSessionAvgs.('TestGroupAvgs')(9,5)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,11),uclBaseSessionAvgs.('BaseGroupAvgs')(13,11)]) uclNormSessionAvgs.('NormGroupAvgs')(1,11) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,11),uclRelySessionAvgs.('RelyGroupAvgs')(3,11)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,11),uclTestSessionAvgs.('TestGroupAvgs')(3,11),uclTestSessionAvgs.('TestGroupAvgs')(5,11),uclTestSessionAvgs.('TestGroupAvgs')(7,11),uclTestSessionAvgs.('TestGroupAvgs')(9,11)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,17),uclBaseSessionAvgs.('BaseGroupAvgs')(13,17)]) uclNormSessionAvgs.('NormGroupAvgs')(1,17) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,17),uclRelySessionAvgs.('RelyGroupAvgs')(3,17)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,17),uclTestSessionAvgs.('TestGroupAvgs')(3,17),uclTestSessionAvgs.('TestGroupAvgs')(5,17),uclTestSessionAvgs.('TestGroupAvgs')(7,17),uclTestSessionAvgs.('TestGroupAvgs')(9,17)])];

% Create top subplot of UCL Space in Throwing Arms
subplot(2,1,1)
bar(barValues1)
title('UCL Space - Throwing Arm')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('UCL BASE','UCL NORM','UCL RELY','UCL TEST','Location','eastoutside');

% Values to plot in bottom subplot
barValues2 = [nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,5),uclBaseSessionAvgs.('BaseGroupAvgs')(14,5)]) uclNormSessionAvgs.('NormGroupAvgs')(2,5) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,5),uclRelySessionAvgs.('RelyGroupAvgs')(4,5)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,5),uclTestSessionAvgs.('TestGroupAvgs')(4,5),uclTestSessionAvgs.('TestGroupAvgs')(6,5),uclTestSessionAvgs.('TestGroupAvgs')(8,5),uclTestSessionAvgs.('TestGroupAvgs')(10,5)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,11),uclBaseSessionAvgs.('BaseGroupAvgs')(14,11)]) uclNormSessionAvgs.('NormGroupAvgs')(2,11) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,11),uclRelySessionAvgs.('RelyGroupAvgs')(4,11)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,11),uclTestSessionAvgs.('TestGroupAvgs')(4,11),uclTestSessionAvgs.('TestGroupAvgs')(6,11),uclTestSessionAvgs.('TestGroupAvgs')(8,11),uclTestSessionAvgs.('TestGroupAvgs')(10,11)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,17),uclBaseSessionAvgs.('BaseGroupAvgs')(14,17)]) uclNormSessionAvgs.('NormGroupAvgs')(2,17) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,17),uclRelySessionAvgs.('RelyGroupAvgs')(4,17)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,17),uclTestSessionAvgs.('TestGroupAvgs')(4,17),uclTestSessionAvgs.('TestGroupAvgs')(6,17),uclTestSessionAvgs.('TestGroupAvgs')(8,17),uclTestSessionAvgs.('TestGroupAvgs')(10,17)])];

% Create bottom subplot of UCL Space in Non-Throwing Arms
subplot(2,1,2)
bar(barValues2)
title('UCL Space - NonThrowing Arm')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('UCL BASE','UCL NORM','UCL RELY','UCL TEST','Location','eastoutside');

% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(3),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(3),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(3))))
end


%%
% Graphing Option 4
groupLabels = {'Supported','Foam-Unstressed','Foam-Stressed'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(4)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');
colormap(barColors4)

% Values to plot in top subplot
barValues1 = [nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,6),uclBaseSessionAvgs.('BaseGroupAvgs')(13,6)]) uclNormSessionAvgs.('NormGroupAvgs')(1,6) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,6),uclRelySessionAvgs.('RelyGroupAvgs')(3,6)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,6),uclTestSessionAvgs.('TestGroupAvgs')(3,6),uclTestSessionAvgs.('TestGroupAvgs')(5,6),uclTestSessionAvgs.('TestGroupAvgs')(7,6),uclTestSessionAvgs.('TestGroupAvgs')(9,6)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,12),uclBaseSessionAvgs.('BaseGroupAvgs')(13,12)]) uclNormSessionAvgs.('NormGroupAvgs')(1,12) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,12),uclRelySessionAvgs.('RelyGroupAvgs')(3,12)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,12),uclTestSessionAvgs.('TestGroupAvgs')(3,12),uclTestSessionAvgs.('TestGroupAvgs')(5,12),uclTestSessionAvgs.('TestGroupAvgs')(7,12),uclTestSessionAvgs.('TestGroupAvgs')(9,12)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(1,18),uclBaseSessionAvgs.('BaseGroupAvgs')(13,18)]) uclNormSessionAvgs.('NormGroupAvgs')(1,18) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,18),uclRelySessionAvgs.('RelyGroupAvgs')(3,18)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(1,18),uclTestSessionAvgs.('TestGroupAvgs')(3,18),uclTestSessionAvgs.('TestGroupAvgs')(5,18),uclTestSessionAvgs.('TestGroupAvgs')(7,18),uclTestSessionAvgs.('TestGroupAvgs')(9,18)])];

% Create top subplot of UH Gap in Throwing Arms
subplot(2,1,1)
bar(barValues1)
title('UH Gap - Throwing Arm')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('UCL BASE','UCL NORM','UCL RELY','UCL TEST','Location','eastoutside');

% Values to plot in bottom subplot
barValues2 = [nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,6),uclBaseSessionAvgs.('BaseGroupAvgs')(14,6)]) uclNormSessionAvgs.('NormGroupAvgs')(2,6) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,6),uclRelySessionAvgs.('RelyGroupAvgs')(4,6)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,6),uclTestSessionAvgs.('TestGroupAvgs')(4,6),uclTestSessionAvgs.('TestGroupAvgs')(6,6),uclTestSessionAvgs.('TestGroupAvgs')(8,6),uclTestSessionAvgs.('TestGroupAvgs')(10,6)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,12),uclBaseSessionAvgs.('BaseGroupAvgs')(14,12)]) uclNormSessionAvgs.('NormGroupAvgs')(2,12) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,12),uclRelySessionAvgs.('RelyGroupAvgs')(4,12)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,12),uclTestSessionAvgs.('TestGroupAvgs')(4,12),uclTestSessionAvgs.('TestGroupAvgs')(6,12),uclTestSessionAvgs.('TestGroupAvgs')(8,12),uclTestSessionAvgs.('TestGroupAvgs')(10,12)]);...
    nanmean([uclBaseSessionAvgs.('BaseGroupAvgs')(2,18),uclBaseSessionAvgs.('BaseGroupAvgs')(14,18)]) uclNormSessionAvgs.('NormGroupAvgs')(2,18) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,18),uclRelySessionAvgs.('RelyGroupAvgs')(4,18)]) nanmean([uclTestSessionAvgs.('TestGroupAvgs')(2,18),uclTestSessionAvgs.('TestGroupAvgs')(4,18),uclTestSessionAvgs.('TestGroupAvgs')(6,18),uclTestSessionAvgs.('TestGroupAvgs')(8,18),uclTestSessionAvgs.('TestGroupAvgs')(10,18)])];

% Create bottom subplot of UH Gap in Non-Throwing Arms
subplot(2,1,2)
bar(barValues2)
title('UH Gap - NonThrowing Arm')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('UCL BASE','UCL NORM','UCL RELY','UCL TEST','Location','eastoutside');

% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(4),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(4),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(4))))
end


%%
% Graphing Option 5
groupLabels = {'Supported','Foam-Unstressed','Foam-Stressed'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(5)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');
colormap(barColors4)

% Values to plot in top-left subplot
barValues1 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,3) uclBaseSessionAvgs.('BaseGroupAvgs')(2,3)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,3) uclBaseSessionAvgs.('BaseGroupAvgs')(14,3);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,9) uclBaseSessionAvgs.('BaseGroupAvgs')(2,9)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,9) uclBaseSessionAvgs.('BaseGroupAvgs')(14,9);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,15) uclBaseSessionAvgs.('BaseGroupAvgs')(2,15)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,15) uclBaseSessionAvgs.('BaseGroupAvgs')(14,15)];

% Create top-left subplot of UCl Length
subplot(2,2,1)
bar(barValues1)
title('UCL BASE - Throwing vs NonThrowing - UCL Length')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 26])
legend('Throwing (Pre)','NonThrowing (Pre)','Throwing (Post)','NonThrowing (Post)','Location','southoutside','Orientation','horizontal');


% Values to plot in top right subplot
barValues2 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,4) uclBaseSessionAvgs.('BaseGroupAvgs')(2,4)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,4) uclBaseSessionAvgs.('BaseGroupAvgs')(14,4);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,10) uclBaseSessionAvgs.('BaseGroupAvgs')(2,10)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,10) uclBaseSessionAvgs.('BaseGroupAvgs')(14,10);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,16) uclBaseSessionAvgs.('BaseGroupAvgs')(2,16)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,16) uclBaseSessionAvgs.('BaseGroupAvgs')(14,16)];

% Create top-right subplot of UCl Thickness
subplot(2,2,2)
bar(barValues2)
title('UCL BASE - Throwing vs NonThrowing - UCL Thickness')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 2])
legend('Throwing (Pre)','NonThrowing (Pre)','Throwing (Post)','NonThrowing (Post)','Location','southoutside','Orientation','horizontal');



% Values to plot in bottom left subplot
barValues3 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,5) uclBaseSessionAvgs.('BaseGroupAvgs')(2,5)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,5) uclBaseSessionAvgs.('BaseGroupAvgs')(14,5);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,11) uclBaseSessionAvgs.('BaseGroupAvgs')(2,11)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,11) uclBaseSessionAvgs.('BaseGroupAvgs')(14,11);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,17) uclBaseSessionAvgs.('BaseGroupAvgs')(2,17)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,17) uclBaseSessionAvgs.('BaseGroupAvgs')(14,17)];

% Create bottom-left subplot of UCl Space
subplot(2,2,3)
bar(barValues3)
title('UCL BASE - Throwing vs NonThrowing - UCL Space')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Throwing (Pre)','NonThrowing (Pre)','Throwing (Post)','NonThrowing (Post)','Location','southoutside','Orientation','horizontal');



% Values to plot in bottom-right subplot
barValues4 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,6) uclBaseSessionAvgs.('BaseGroupAvgs')(2,6)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,6) uclBaseSessionAvgs.('BaseGroupAvgs')(14,6);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,12) uclBaseSessionAvgs.('BaseGroupAvgs')(2,12)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,12) uclBaseSessionAvgs.('BaseGroupAvgs')(14,12);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,18) uclBaseSessionAvgs.('BaseGroupAvgs')(2,18)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(13,18) uclBaseSessionAvgs.('BaseGroupAvgs')(14,18)];

% Create bottom-right subplot of UCL Length
subplot(2,2,4)
bar(barValues4)
title('UCL BASE - Throwing vs NonThrowing - UH Gap')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Throwing (Pre)','NonThrowing (Pre)','Throwing (Post)','NonThrowing (Post)','Location','southoutside','Orientation','horizontal');


% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(5),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(5),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(5))))
end



%%
% Graphing Option 6
groupLabels = {'Supported','Foam-Unstressed','Foam-Stressed'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(6)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');
colormap(barColors2)

% Values to plot in top-left subplot
barValues1 = [uclNormSessionAvgs.('NormGroupAvgs')(1,3) uclNormSessionAvgs.('NormGroupAvgs')(2,3);...
    uclNormSessionAvgs.('NormGroupAvgs')(1,9) uclNormSessionAvgs.('NormGroupAvgs')(2,9);...
    uclNormSessionAvgs.('NormGroupAvgs')(1,15) uclNormSessionAvgs.('NormGroupAvgs')(2,15)];

% Create top-left subplot of UCl Length
subplot(2,2,1)
bar(barValues1)
title('UCL NORM - UCL Length')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 26])
legend('Throwing','NonThrowing','Location','southoutside','Orientation','horizontal');


% Values to plot in top right subplot
barValues2 = [uclNormSessionAvgs.('NormGroupAvgs')(1,4) uclNormSessionAvgs.('NormGroupAvgs')(2,4);
    uclNormSessionAvgs.('NormGroupAvgs')(1,10) uclNormSessionAvgs.('NormGroupAvgs')(2,10);
    uclNormSessionAvgs.('NormGroupAvgs')(1,16) uclNormSessionAvgs.('NormGroupAvgs')(2,16)];

% Create top-right subplot of UCl Thickness
subplot(2,2,2)
bar(barValues2)
title('UCL NORM - UCL Thickness')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 2])
legend('Throwing','NonThrowing','Location','southoutside','Orientation','horizontal');


% Values to plot in bottom left subplot
barValues3 = [uclNormSessionAvgs.('NormGroupAvgs')(1,5) uclNormSessionAvgs.('NormGroupAvgs')(2,5);...
    uclNormSessionAvgs.('NormGroupAvgs')(1,11) uclNormSessionAvgs.('NormGroupAvgs')(2,11);...
    uclNormSessionAvgs.('NormGroupAvgs')(1,17) uclNormSessionAvgs.('NormGroupAvgs')(2,17)];

% Create bottom-left subplot of UCl Space
subplot(2,2,3)
bar(barValues3)
title('UCL NORM - UCL Space')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Throwing','NonThrowing','Location','southoutside','Orientation','horizontal');


% Values to plot in bottom-right subplot
barValues4 = [uclNormSessionAvgs.('NormGroupAvgs')(1,6) uclNormSessionAvgs.('NormGroupAvgs')(2,6);...
    uclNormSessionAvgs.('NormGroupAvgs')(1,12) uclNormSessionAvgs.('NormGroupAvgs')(2,12);...
    uclNormSessionAvgs.('NormGroupAvgs')(1,18) uclNormSessionAvgs.('NormGroupAvgs')(2,18)];

% Create bottom-right subplot of UH Gap
subplot(2,2,4)
bar(barValues4)
title('UCL NORM - UH Gap')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Throwing','NonThrowing','Location','southoutside','Orientation','horizontal');


% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(6),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(6),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(6))))
end


%%
% Graphing Option 7
groupLabels = {'Supported','Foam-Unstressed','Foam-Stressed'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(7)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');
colormap(barColors2)

% Values to plot in top-left subplot
barValues1 = [nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,3),uclRelySessionAvgs.('RelyGroupAvgs')(3,3)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,3),uclRelySessionAvgs.('RelyGroupAvgs')(4,3)]);...
    nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,9),uclRelySessionAvgs.('RelyGroupAvgs')(3,9)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,9),uclRelySessionAvgs.('RelyGroupAvgs')(4,9)]);...
    nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,15),uclRelySessionAvgs.('RelyGroupAvgs')(3,15)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,15),uclRelySessionAvgs.('RelyGroupAvgs')(4,15)])];

% Create top-left subplot of UCl Length
subplot(2,2,1)
bar(barValues1)
title('UCL RELY - UCL Length')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 26])
legend('Throwing','NonThrowing','Location','southoutside','Orientation','horizontal');


% Values to plot in top right subplot
barValues2 = [nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,4),uclRelySessionAvgs.('RelyGroupAvgs')(3,4)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,4),uclRelySessionAvgs.('RelyGroupAvgs')(4,4)]);...
    nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,10),uclRelySessionAvgs.('RelyGroupAvgs')(3,10)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,10),uclRelySessionAvgs.('RelyGroupAvgs')(4,10)]);...
    nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,16),uclRelySessionAvgs.('RelyGroupAvgs')(3,16)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,16),uclRelySessionAvgs.('RelyGroupAvgs')(4,16)])];

% Create top-right subplot of UCl Thickness
subplot(2,2,2)
bar(barValues2)
title('UCL RELY - UCL Thickness')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 2])
legend('Throwing','NonThrowing','Location','southoutside','Orientation','horizontal');


% Values to plot in bottom left subplot
barValues3 = [nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,5),uclRelySessionAvgs.('RelyGroupAvgs')(3,5)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,5),uclRelySessionAvgs.('RelyGroupAvgs')(4,5)]);...
    nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,11),uclRelySessionAvgs.('RelyGroupAvgs')(3,11)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,11),uclRelySessionAvgs.('RelyGroupAvgs')(4,11)]);...
    nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,17),uclRelySessionAvgs.('RelyGroupAvgs')(3,17)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,17),uclRelySessionAvgs.('RelyGroupAvgs')(4,17)])];

% Create bottom-left subplot of UCl Space
subplot(2,2,3)
bar(barValues3)
title('UCL RELY - UCL Space')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Throwing','NonThrowing','Location','southoutside','Orientation','horizontal');


% Values to plot in bottom-right subplot
barValues4 = [nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,6),uclRelySessionAvgs.('RelyGroupAvgs')(3,6)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,6),uclRelySessionAvgs.('RelyGroupAvgs')(4,6)]);...
    nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,12),uclRelySessionAvgs.('RelyGroupAvgs')(3,12)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,12),uclRelySessionAvgs.('RelyGroupAvgs')(4,12)]);...
    nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(1,18),uclRelySessionAvgs.('RelyGroupAvgs')(3,18)]) nanmean([uclRelySessionAvgs.('RelyGroupAvgs')(2,18),uclRelySessionAvgs.('RelyGroupAvgs')(4,18)])];
 
% Create bottom-right subplot of UH Gap
subplot(2,2,4)
bar(barValues4)
title('UCL RELY - UH Gap')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Throwing','NonThrowing','Location','southoutside','Orientation','horizontal');


% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(7),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(7),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(7))))
end



%%
% Graphing Option 8

% Only label these specific tick marks to prevent labels from overlapping
groupLabels = {'Pre','Ins3','Ins6','Ins9','Post'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(8)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');

% Values to plot subplot 1
barValues1 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,3) uclBaseSessionAvgs.('BaseGroupAvgs')(3,3) uclBaseSessionAvgs.('BaseGroupAvgs')(4,3),uclBaseSessionAvgs.('BaseGroupAvgs')(5,3)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,3) uclBaseSessionAvgs.('BaseGroupAvgs')(7,3) uclBaseSessionAvgs.('BaseGroupAvgs')(8,3) uclBaseSessionAvgs.('BaseGroupAvgs')(9,3)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,3) uclBaseSessionAvgs.('BaseGroupAvgs')(11,3) uclBaseSessionAvgs.('BaseGroupAvgs')(12,3) uclBaseSessionAvgs.('BaseGroupAvgs')(13,3)];

% Create subplot 1
subplot(4,3,1)
bar(barValues1,'FaceColor',([89 42 138]/255))
title('UCL BASE - UCL LENGTH - SUPPORTED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 26])

% Values to plot subplot 2
barValues2 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,9) uclBaseSessionAvgs.('BaseGroupAvgs')(9,9) uclBaseSessionAvgs.('BaseGroupAvgs')(4,9),uclBaseSessionAvgs.('BaseGroupAvgs')(5,9)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,9) uclBaseSessionAvgs.('BaseGroupAvgs')(7,9) uclBaseSessionAvgs.('BaseGroupAvgs')(8,9) uclBaseSessionAvgs.('BaseGroupAvgs')(9,9)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,9) uclBaseSessionAvgs.('BaseGroupAvgs')(11,9) uclBaseSessionAvgs.('BaseGroupAvgs')(12,9) uclBaseSessionAvgs.('BaseGroupAvgs')(13,9)];

% Create subplot 2
subplot(4,3,2)
bar(barValues2,'FaceColor',([254 201 35]/255))
title('UCL BASE - UCL LENGTH - FOAM-UNSTRESSED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 26])


% Values to plot subplot 3
barValues3 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,15) uclBaseSessionAvgs.('BaseGroupAvgs')(3,15) uclBaseSessionAvgs.('BaseGroupAvgs')(4,15),uclBaseSessionAvgs.('BaseGroupAvgs')(5,15)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,15) uclBaseSessionAvgs.('BaseGroupAvgs')(7,15) uclBaseSessionAvgs.('BaseGroupAvgs')(8,15) uclBaseSessionAvgs.('BaseGroupAvgs')(9,15)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,15) uclBaseSessionAvgs.('BaseGroupAvgs')(11,15) uclBaseSessionAvgs.('BaseGroupAvgs')(12,15) uclBaseSessionAvgs.('BaseGroupAvgs')(13,15)];

% Create subplot 3
subplot(4,3,3)
bar(barValues3,'FaceColor',[0 0 0])
title('UCL BASE - UCL LENGTH - FOAM-STRESSED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 26])


% Values to plot subplot 4
barValues4 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,4) uclBaseSessionAvgs.('BaseGroupAvgs')(3,4) uclBaseSessionAvgs.('BaseGroupAvgs')(4,4),uclBaseSessionAvgs.('BaseGroupAvgs')(5,4)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,4) uclBaseSessionAvgs.('BaseGroupAvgs')(7,4) uclBaseSessionAvgs.('BaseGroupAvgs')(8,4) uclBaseSessionAvgs.('BaseGroupAvgs')(9,4)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,4) uclBaseSessionAvgs.('BaseGroupAvgs')(11,4) uclBaseSessionAvgs.('BaseGroupAvgs')(12,4) uclBaseSessionAvgs.('BaseGroupAvgs')(13,4)];

% Create subplot 4
subplot(4,3,4)
bar(barValues4,'FaceColor',[89 42 138]/255)
title('UCL BASE - UCL THICKNESS - SUPPORTED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 2])


% Values to plot subplot 5
barValues5 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,10) uclBaseSessionAvgs.('BaseGroupAvgs')(9,10) uclBaseSessionAvgs.('BaseGroupAvgs')(4,10),uclBaseSessionAvgs.('BaseGroupAvgs')(5,10)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,10) uclBaseSessionAvgs.('BaseGroupAvgs')(7,10) uclBaseSessionAvgs.('BaseGroupAvgs')(8,10) uclBaseSessionAvgs.('BaseGroupAvgs')(9,10)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,10) uclBaseSessionAvgs.('BaseGroupAvgs')(11,10) uclBaseSessionAvgs.('BaseGroupAvgs')(12,10) uclBaseSessionAvgs.('BaseGroupAvgs')(13,10)];

% Create subplot 5
subplot(4,3,5)
bar(barValues5,'FaceColor',[254 201 35]/255)
title('UCL BASE - UCL THICKNESS - FOAM-UNSTRESSED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 2])


% Values to plot subplot 6
barValues6 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,16) uclBaseSessionAvgs.('BaseGroupAvgs')(3,16) uclBaseSessionAvgs.('BaseGroupAvgs')(4,16),uclBaseSessionAvgs.('BaseGroupAvgs')(5,16)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,16) uclBaseSessionAvgs.('BaseGroupAvgs')(7,16) uclBaseSessionAvgs.('BaseGroupAvgs')(8,16) uclBaseSessionAvgs.('BaseGroupAvgs')(9,16)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,16) uclBaseSessionAvgs.('BaseGroupAvgs')(11,16) uclBaseSessionAvgs.('BaseGroupAvgs')(12,16) uclBaseSessionAvgs.('BaseGroupAvgs')(13,16)];

% Create subplot 6
subplot(4,3,6)
bar(barValues6,'FaceColor',[0 0 0])
title('UCL BASE - UCL THICKNESS - FOAM-STRESSED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 2])


% Values to plot subplot 7
barValues7 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,5) uclBaseSessionAvgs.('BaseGroupAvgs')(3,5) uclBaseSessionAvgs.('BaseGroupAvgs')(4,5),uclBaseSessionAvgs.('BaseGroupAvgs')(5,5)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,5) uclBaseSessionAvgs.('BaseGroupAvgs')(7,5) uclBaseSessionAvgs.('BaseGroupAvgs')(8,5) uclBaseSessionAvgs.('BaseGroupAvgs')(9,5)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,5) uclBaseSessionAvgs.('BaseGroupAvgs')(11,5) uclBaseSessionAvgs.('BaseGroupAvgs')(12,5) uclBaseSessionAvgs.('BaseGroupAvgs')(13,5)];

% Create subplot 7
subplot(4,3,7)
bar(barValues7,'FaceColor',[89 42 138]/255)
title('UCL BASE - UCL SPACE - SUPPORTED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 7.5])


% Values to plot subplot 8
barValues8 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,11) uclBaseSessionAvgs.('BaseGroupAvgs')(9,11) uclBaseSessionAvgs.('BaseGroupAvgs')(4,11),uclBaseSessionAvgs.('BaseGroupAvgs')(5,11)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,11) uclBaseSessionAvgs.('BaseGroupAvgs')(7,11) uclBaseSessionAvgs.('BaseGroupAvgs')(8,11) uclBaseSessionAvgs.('BaseGroupAvgs')(9,11)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,11) uclBaseSessionAvgs.('BaseGroupAvgs')(11,11) uclBaseSessionAvgs.('BaseGroupAvgs')(12,11) uclBaseSessionAvgs.('BaseGroupAvgs')(13,11)];

% Create subplot 8
subplot(4,3,8)
bar(barValues8,'FaceColor',[254 201 35]/255)
title('UCL BASE - UCL SPACE - FOAM-UNSTRESSED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 7.5])


% Values to plot subplot 9
barValues9 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,17) uclBaseSessionAvgs.('BaseGroupAvgs')(3,17) uclBaseSessionAvgs.('BaseGroupAvgs')(4,17),uclBaseSessionAvgs.('BaseGroupAvgs')(5,17)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,17) uclBaseSessionAvgs.('BaseGroupAvgs')(7,17) uclBaseSessionAvgs.('BaseGroupAvgs')(8,17) uclBaseSessionAvgs.('BaseGroupAvgs')(9,17)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,17) uclBaseSessionAvgs.('BaseGroupAvgs')(11,17) uclBaseSessionAvgs.('BaseGroupAvgs')(12,17) uclBaseSessionAvgs.('BaseGroupAvgs')(13,17)];

% Create subplot 9
subplot(4,3,9)
bar(barValues9,'FaceColor',[0 0 0])
title('UCL BASE - UCL SPACE - FOAM-STRESSED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 7.5])


% Values to plot subplot 10
barValues10 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,6) uclBaseSessionAvgs.('BaseGroupAvgs')(3,6) uclBaseSessionAvgs.('BaseGroupAvgs')(4,6),uclBaseSessionAvgs.('BaseGroupAvgs')(5,6)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,6) uclBaseSessionAvgs.('BaseGroupAvgs')(7,6) uclBaseSessionAvgs.('BaseGroupAvgs')(8,6) uclBaseSessionAvgs.('BaseGroupAvgs')(9,6)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,6) uclBaseSessionAvgs.('BaseGroupAvgs')(11,6) uclBaseSessionAvgs.('BaseGroupAvgs')(12,6) uclBaseSessionAvgs.('BaseGroupAvgs')(13,6)];

% Create subplot 10
subplot(4,3,10)
bar(barValues10,'FaceColor',[89 42 138]/255)
title('UCL BASE - UH GAP - SUPPORTED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 7.5])


% Values to plot subplot 11
barValues11 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,12) uclBaseSessionAvgs.('BaseGroupAvgs')(9,12) uclBaseSessionAvgs.('BaseGroupAvgs')(4,12),uclBaseSessionAvgs.('BaseGroupAvgs')(5,12)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,12) uclBaseSessionAvgs.('BaseGroupAvgs')(7,12) uclBaseSessionAvgs.('BaseGroupAvgs')(8,12) uclBaseSessionAvgs.('BaseGroupAvgs')(9,12)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,12) uclBaseSessionAvgs.('BaseGroupAvgs')(11,12) uclBaseSessionAvgs.('BaseGroupAvgs')(12,12) uclBaseSessionAvgs.('BaseGroupAvgs')(13,12)];

% Create subplot 11
subplot(4,3,11)
bar(barValues11,'FaceColor',[254 201 35]/255)
title('UCL BASE - UH GAP - FOAM-UNSTRESSED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 7.5])


% Values to plot subplot 12
barValues12 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,18) uclBaseSessionAvgs.('BaseGroupAvgs')(3,18) uclBaseSessionAvgs.('BaseGroupAvgs')(4,18),uclBaseSessionAvgs.('BaseGroupAvgs')(5,18)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(6,18) uclBaseSessionAvgs.('BaseGroupAvgs')(7,18) uclBaseSessionAvgs.('BaseGroupAvgs')(8,18) uclBaseSessionAvgs.('BaseGroupAvgs')(9,18)...
    uclBaseSessionAvgs.('BaseGroupAvgs')(10,18) uclBaseSessionAvgs.('BaseGroupAvgs')(11,18) uclBaseSessionAvgs.('BaseGroupAvgs')(12,18) uclBaseSessionAvgs.('BaseGroupAvgs')(13,18)];

% Create subplot 12
subplot(4,3,12)
bar(barValues12,'FaceColor',[0 0 0])
title('UCL BASE - UH GAP - FOAM-STRESSED')
xlabel('Collection')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'xtick',[1,4,7,10,12],'ylim',[0 7.5])


% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(8),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(8),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(8))))
end



%%
% Graphing Option 9
groupLabels = {'Supported','Foam-Unstressed','Foam-Stressed'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(9)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');
colormap(barColors4)

% Values to plot in top-left subplot
barValues1 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,3) uclNormSessionAvgs.('NormGroupAvgs')(1,3) uclBaseSessionAvgs.('BaseGroupAvgs')(2,3) uclNormSessionAvgs.('NormGroupAvgs')(2,3);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,9) uclNormSessionAvgs.('NormGroupAvgs')(1,9) uclBaseSessionAvgs.('BaseGroupAvgs')(2,9) uclNormSessionAvgs.('NormGroupAvgs')(2,9);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,15) uclNormSessionAvgs.('NormGroupAvgs')(1,15) uclBaseSessionAvgs.('BaseGroupAvgs')(2,15) uclNormSessionAvgs.('NormGroupAvgs')(2,15)];

% Create top-left subplot of UCl Length
subplot(2,2,1)
bar(barValues1)
title('UCL BASE vs UCL NORM - UCL Length')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 26])
legend('BASE-Throwing','NORM-Throwing','BASE-NonThrowing','NORM-NonThrowing','Location','southoutside','Orientation','horizontal');


% Values to plot in top right subplot
barValues2 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,4) uclNormSessionAvgs.('NormGroupAvgs')(1,4) uclBaseSessionAvgs.('BaseGroupAvgs')(2,4) uclNormSessionAvgs.('NormGroupAvgs')(2,4);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,10) uclNormSessionAvgs.('NormGroupAvgs')(1,10) uclBaseSessionAvgs.('BaseGroupAvgs')(2,10) uclNormSessionAvgs.('NormGroupAvgs')(2,10);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,16) uclNormSessionAvgs.('NormGroupAvgs')(1,16) uclBaseSessionAvgs.('BaseGroupAvgs')(2,16) uclNormSessionAvgs.('NormGroupAvgs')(2,16)];

% Create top-right subplot of UCl Thickness
subplot(2,2,2)
bar(barValues2)
title('UCL BASE vs UCL NORM - UCL Thickness')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 2])
legend('BASE-Throwing','NORM-Throwing','BASE-NonThrowing','NORM-NonThrowing','Location','southoutside','Orientation','horizontal');


% Values to plot in bottom left subplot
barValues3 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,5) uclNormSessionAvgs.('NormGroupAvgs')(1,5) uclBaseSessionAvgs.('BaseGroupAvgs')(2,5) uclNormSessionAvgs.('NormGroupAvgs')(2,5);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,11) uclNormSessionAvgs.('NormGroupAvgs')(1,11) uclBaseSessionAvgs.('BaseGroupAvgs')(2,11) uclNormSessionAvgs.('NormGroupAvgs')(2,11);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,17) uclNormSessionAvgs.('NormGroupAvgs')(1,17) uclBaseSessionAvgs.('BaseGroupAvgs')(2,17) uclNormSessionAvgs.('NormGroupAvgs')(2,17)];

% Create bottom-left subplot of UCL Space
subplot(2,2,3)
bar(barValues3)
title('UCL BASE vs UCL NORM - UCL Space')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('BASE-Throwing','NORM-Throwing','BASE-NonThrowing','NORM-NonThrowing','Location','southoutside','Orientation','horizontal');


% Values to plot in bottom-right subplot
barValues4 = [uclBaseSessionAvgs.('BaseGroupAvgs')(1,6) uclNormSessionAvgs.('NormGroupAvgs')(1,6) uclBaseSessionAvgs.('BaseGroupAvgs')(2,6) uclNormSessionAvgs.('NormGroupAvgs')(2,6);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,12) uclNormSessionAvgs.('NormGroupAvgs')(1,12) uclBaseSessionAvgs.('BaseGroupAvgs')(2,12) uclNormSessionAvgs.('NormGroupAvgs')(2,12);...
    uclBaseSessionAvgs.('BaseGroupAvgs')(1,18) uclNormSessionAvgs.('NormGroupAvgs')(1,18) uclBaseSessionAvgs.('BaseGroupAvgs')(2,18) uclNormSessionAvgs.('NormGroupAvgs')(2,18)];
 
% Create bottom-right subplot of UH GAP
subplot(2,2,4)
bar(barValues4)
title('UCL BASE vs UCL NORM - UH Gap')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('BASE-Throwing','NORM-Throwing','BASE-NonThrowing','NORM-NonThrowing','Location','southoutside','Orientation','horizontal');


% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(9),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(9),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(9))))
end



%%
% Graphing Option 10
groupLabels = {'Supported','Foam-Unstressed','Foam-Stressed'};

% Name Figure and Select Color Map
figure('Name',char(figureNames(10)),'NumberTitle','off','Units','Normalized','Position',[0 0 1 1],'Visible','off');
colormap(barColors2)

% Values to plot in subplot 1
barValues1 = [uclRelySessionAvgs.('RelyGroupAvgs')(1,3) uclRelySessionAvgs.('RelyGroupAvgs')(1,3);...
    uclRelySessionAvgs.('RelyGroupAvgs')(1,9) uclRelySessionAvgs.('RelyGroupAvgs')(3,9);...
    uclRelySessionAvgs.('RelyGroupAvgs')(1,15) uclRelySessionAvgs.('RelyGroupAvgs')(3,15)];

% Create top-left subplot of UCl Length
subplot(2,4,1)
bar(barValues1)
title('UCL RELY - Throwing - UCL Length')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 26])
legend('Day 1','Day 2','Location','southoutside','Orientation','horizontal');


% Values to plot in subplot 2
barValues2 = [uclRelySessionAvgs.('RelyGroupAvgs')(1,4) uclRelySessionAvgs.('RelyGroupAvgs')(3,4);...
    uclRelySessionAvgs.('RelyGroupAvgs')(1,10) uclRelySessionAvgs.('RelyGroupAvgs')(3,10);
    uclRelySessionAvgs.('RelyGroupAvgs')(1,16) uclRelySessionAvgs.('RelyGroupAvgs')(3,16)];

% Create subplot 2
subplot(2,4,2)
bar(barValues2)
title('UCL RELY - Throwing - UCL Thickness')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 2])
legend('Day 1','Day 2','Location','southoutside','Orientation','horizontal');


% Values to plot in subplot 3
barValues3 = [uclRelySessionAvgs.('RelyGroupAvgs')(1,5) uclRelySessionAvgs.('RelyGroupAvgs')(3,5);
    uclRelySessionAvgs.('RelyGroupAvgs')(1,11) uclRelySessionAvgs.('RelyGroupAvgs')(3,11);
    uclRelySessionAvgs.('RelyGroupAvgs')(1,17) uclRelySessionAvgs.('RelyGroupAvgs')(3,17)];

% Create subplot 3
subplot(2,4,3)
bar(barValues3)
title('UCL RELY - Throwing - UCL Space')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Day 1','Day 2','Location','southoutside','Orientation','horizontal');


% Values to plot in subplot 4
barValues4 = [uclRelySessionAvgs.('RelyGroupAvgs')(1,6) uclRelySessionAvgs.('RelyGroupAvgs')(3,6);
    uclRelySessionAvgs.('RelyGroupAvgs')(1,12) uclRelySessionAvgs.('RelyGroupAvgs')(3,12);
    uclRelySessionAvgs.('RelyGroupAvgs')(1,18) uclRelySessionAvgs.('RelyGroupAvgs')(3,18)];
 
% Create subplot 4
subplot(2,4,4)
bar(barValues4)
title('UCL RELY - Throwing - UH Gap')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Day 1','Day 2','Location','southoutside','Orientation','horizontal');


% Values to plot in subplot 5
barValues5 = [uclRelySessionAvgs.('RelyGroupAvgs')(2,3) uclRelySessionAvgs.('RelyGroupAvgs')(4,3);...
    uclRelySessionAvgs.('RelyGroupAvgs')(2,9) uclRelySessionAvgs.('RelyGroupAvgs')(4,9);...
    uclRelySessionAvgs.('RelyGroupAvgs')(2,15) uclRelySessionAvgs.('RelyGroupAvgs')(4,15)];

% Create subplot 5
subplot(2,4,5)
bar(barValues5)
title('UCL RELY - NonThrowing - UCL Length')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 26])
legend('Day 1','Day 2','Location','southoutside','Orientation','horizontal');


% Values to plot in subplot 6
barValues6 = [uclRelySessionAvgs.('RelyGroupAvgs')(2,4) uclRelySessionAvgs.('RelyGroupAvgs')(4,4);...
    uclRelySessionAvgs.('RelyGroupAvgs')(2,10) uclRelySessionAvgs.('RelyGroupAvgs')(4,10);
    uclRelySessionAvgs.('RelyGroupAvgs')(2,16) uclRelySessionAvgs.('RelyGroupAvgs')(4,16)];

% Create subplot 6
subplot(2,4,6)
bar(barValues6)
title('UCL RELY - NonThrowing - UCL Thickness')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 2])
legend('Day 1','Day 2','Location','southoutside','Orientation','horizontal');


% Values to plot in subplot 7
barValues7 = [uclRelySessionAvgs.('RelyGroupAvgs')(2,5) uclRelySessionAvgs.('RelyGroupAvgs')(4,5);
    uclRelySessionAvgs.('RelyGroupAvgs')(2,11) uclRelySessionAvgs.('RelyGroupAvgs')(4,11);
    uclRelySessionAvgs.('RelyGroupAvgs')(2,17) uclRelySessionAvgs.('RelyGroupAvgs')(4,17)];

% Create subplot 7
subplot(2,4,7)
bar(barValues7)
title('UCL RELY - NonThrowing - UCL Space')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Day 1','Day 2','Location','southoutside','Orientation','horizontal');


% Values to plot in subplot 8
barValues8 = [uclRelySessionAvgs.('RelyGroupAvgs')(2,6) uclRelySessionAvgs.('RelyGroupAvgs')(4,6);
    uclRelySessionAvgs.('RelyGroupAvgs')(2,12) uclRelySessionAvgs.('RelyGroupAvgs')(4,12);
    uclRelySessionAvgs.('RelyGroupAvgs')(2,18) uclRelySessionAvgs.('RelyGroupAvgs')(4,18)];
 
% Create subplot 8
subplot(2,4,8)
bar(barValues8)
title('UCL RELY - NonThrowing - UH Gap')
xlabel('Condition')
ylabel('Length (mm)')
set(gca,'xticklabel',groupLabels,'ylim',[0 7.5])
legend('Day 1','Day 2','Location','southoutside','Orientation','horizontal');



% Show figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Plot(10),1)
    set(gcf,'Visible','on')
end

% Save figure if selected by user in uclAnalysisGraphingOptions
if isequal(graphs2Save(10),1)
    saveas(gcf,char(strcat(date,'-',figureFileNames(10))))
end

