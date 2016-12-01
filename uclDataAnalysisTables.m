function uclDataAnalysisTables
%%  uclDataAnalysisTables
%  
%  Christopher Curran, East Carolina University
%  December 1st, 2016
%  
%  This function will display data analysis tables for all four UCL Research
%  data sets

%  calling
%  --------
%  uclDataAnalysistables
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
%  
%  
%  variables
%  --------
%  uclBaseSessionAvgs           - mat File containing group and individual means for UCL BASE Imaging sessions
%  uclNormSessionAvgs           - mat File containing group and individual means for UCL NORM Imaging sessions
%  uclRelySessionAvgs           - mat File containing group and individual means for UCL RELY Imaging sessions
%  uclTestSessionAvgs           - mat File containing group and individual means for UCL TEST Imaging sessions
%  
%  uclBaseAvgsNames             - Fields for UCL BASE struct mat file
%  uclNormAvgsNames             - Fields for UCL NORM struct mat file
%  uclRelyAvgsNames             - Fields for UCL RELY struct mat file
%  uclTestAvgsNames             - Fields for UCL TEST struct mat file
%  
%  uclBaseRowNames              - Row Name strings for UCL BASE Data Table
%  uclNormRowNames              - Row Name strings for UCL NORM Data Table
%  uclRelyRowNames              - Row Name strings for UCL RELY Data Table
%  uclTestRowNames              - Row Name strings for UCL TEST Data Table
%  
%  dataAnalysisVariableNames    - column names for UCL data analysis tables
%  uclDataAnalysisFigure        - Figure containing data tables for UCL studies
%  
%  uclBaseDataTable             - data table containing group means for UCL BASE
%  uclNormDataTable             - data table containing group means for UCL NORM
%  uclRelyDataTable             - data table containing group means for UCL RELY
%  uclTestDataTable             - data table containing group means for UCL TEST
%  
%  graphAnalysisAnswer          - User response for whether or not to graph ucl data


%%

% load sessionAvgs mat File
uclBaseSessionAvgs = load('uclBaseSessionAvgs.mat');
uclNormSessionAvgs = load('uclNormSessionAvgs.mat');
uclRelySessionAvgs = load('uclRelySessionAvgs.mat');
uclTestSessionAvgs = load('uclTestSessionAvgs.mat');


% Get fields from sessionavgs mat Files
uclBaseAvgsNames = fieldnames(uclBaseSessionAvgs);
uclNormAvgsNames = fieldnames(uclNormSessionAvgs);
uclRelyAvgsNames = fieldnames(uclRelySessionAvgs);
uclTestAvgsNames = fieldnames(uclTestSessionAvgs);


% Create Row Names for UCL BASE
uclBaseRowNames = {'PreSeason_Throw','PreSeason_NonThrow',...
            'InSeason1_Throw','InSeason2_Throw','InSeason3_Throw','InSeason4_Throw',...
            'InSeason5_Throw','InSeason6_Throw','InSeason7_Throw','InSeason8_Throw','InSeason9_Throw',...
            'InSeason10_Throw','PostSeason_Throw','PostSeason_NonThrow '};
        
% Row Names for UCL NORM
uclNormRowNames = {'Throw','      NonThrow      '};

% Row Names for UCL RELY
uclRelyRowNames = {'Collection1_Throw','Collection1_NonThrow','Collection2_Throw','Collection2_NonThrow'};

% Row Names for UCL TEST
uclTestRowNames = {'Collection1_Throw','Collection1_NonThrow',...
            'Collection2_Throw','Collection2_NonThrow','Collection3_Throw','Collection3_NonThrow',...
            'Collection4_Throw','Collection4_NonThrow','Collection5_Throw','Collection5_NonThrow'};

% Create Variable Names from mat File
dataAnalysisVariableNames = [{'Complete Subjects-Supp'},{'Total Trials-Supp'},...
    {'Length-Supp'},{'Thickness-Supp'},{'Space-Supp'},{'Gap-Supp'},...
    {'Complete Subjects-FmUn'},{'Total Trials-FmUn'},...
    {'Length-FmUn'},{'Thickness-FmUn'},{'Space-FmUn'},{'Gap-FmUn'},...
    {'Complete Subjects-FmSt'},{'Total Trials-FmSt'},...
    {'Length-FmSt'},{'Thickness-FmSt'},{'Space-FmSt'},{'Gap-FmSt'}]';

% Create figure to display UCL Research Data Tables in
uclDataTableFigure = figure('Name','UCL Data Analysis Tables','NumberTitle','off','Units','Normalized','Position',[0 0 1 1]);

% add UCL BASE data table to uclDataAnalysisFigure
uclBaseDataTable = uitable(uclDataTableFigure,'Data',uclBaseSessionAvgs.(char(uclBaseAvgsNames(length(uclBaseAvgsNames)))),...
    'ColumnName',dataAnalysisVariableNames,'RowName',uclBaseRowNames,...
    'Units','normalized','Position',[0,.70,1,.30]);

% add UCL NORM data table to uclDataAnalysisFigure
uclNormDataTable = uitable(uclDataTableFigure,'Data',uclNormSessionAvgs.(char(uclNormAvgsNames(length(uclNormAvgsNames)))),...
    'ColumnName',dataAnalysisVariableNames,'RowName',uclNormRowNames,...
    'Units','normalized','Position',[0,.60,1,.07]);

% add UCL RELY data table to uclDataAnalysisFigure
uclRelyDataTable = uitable(uclDataTableFigure,'Data',uclRelySessionAvgs.(char(uclRelyAvgsNames(length(uclRelyAvgsNames)))),...
    'ColumnName',dataAnalysisVariableNames,'RowName',uclRelyRowNames,...
    'Units','normalized','Position',[0,.45,1,.10]);

% add UCL TEST data table to uclDataAnalysisFigure
uclTestDataTable = uitable(uclDataTableFigure,'Data',uclTestSessionAvgs.(char(uclTestAvgsNames(length(uclTestAvgsNames)))),...
    'ColumnName',dataAnalysisVariableNames,'RowName',uclTestRowNames,...
    'Units','normalized','Position',[0,0,1,.40]);

uiwait

%% Ask User if they want to graph any of the UCL Analysis

graphAnalysisAnswer = questdlg('Would you like to graph any of the UCL Analysis Data?','Graph Data?','Yes','No','No');

% if user selects yes, then run uclAnalysisGraphAndSave
if isequal(graphAnalysisAnswer,'Yes')
    run uclAnalysisGraphAndSave
end

%function end
end