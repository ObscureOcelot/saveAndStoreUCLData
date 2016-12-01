function curranFinalProject
%%  curranFinalProject
%  
%  Christopher Curran, East Carolina University
%  December 1st, 2016
%  
%  This function will sort, store, analyze, and graphically display
%  structural and material property data taken from ultrasonic imaging
%  of the ulnar collateral ligament.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                   %
%                                %%% PATRICK %%%                                    %
%                                                                                   %
%  To start form scratch, you only need to have curranFinalProjectSampleData.csv    %
%  from blackboard in the curent folder. However, this will take several iterations %
%  of the code to populate the data set enough for the graphs to look decent.       %
%                                                                                   %
%  To run the code with populated data, include the 8 .mat files and                %
%  curranFinalProjectProcessedData.csv from the email in the current folder.        %
%  Not to patronize, but to show I thought about this, make sure there aren't       %
%  duplicate .mat files or csv files before running it with the populated data.     %
%                                                                                   %
%  also, I am aware of the bug that there is a modal questdlg after the graphs      %
%  appear, meaning you can not continue going through the plots before choosing     %
%  whether or not to process data from another image.                               %
%                                                                                   %
%                               %%% Go Pack Go %%%                                  %
%                                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  This code was written to fulfill the requirements of the final project for
%  the ECU class KINE 6803.
%  
%  
%  calling
%  --------
%  curranFinalProject
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
%  createUCLMatFiles
%  importCurranSampleData
%  uclImageDataDecoder
%  uclAnalysisCustomDataEntry
%  uclDataAnalysisTables
%  
%  
%  subfunctions called
%  --------
%  
%  
%  variables
%  --------
%  subjectChoiceString      - string of participant names to be used in dataSetChoice listdlg
%  sampleData               - matrix containing 100 sample trials of data
%  processedData            - matrix containing each processed trial
%  processedDataErrorAnswer - user response whether or not to create blank csv file for processed Data
%  matErrorAnswer           - User response to dialog that mat files are not in current folder
%  customDataAnswer         - user response whether to use sample data or enter custom data
%  imageData                - matrix of numerical data for selected participant
%  study                    - numerical input describing which UCL study data is from
%                             1 = UCL BASE, 2 = UCL NORM, 3 = UCL RELY, 4 = UCL TEST
%  subjectNum               - numerical input decsribing the participant's number
%  collection               - numerical input describing which imaging session the data is from
%  arm                      - numerical input describing which arm the data is from
%                             0 = Non-Throwing Arm, 1 = Throwing Arm
%  condition                - numerical input describing which condition the imaging was performed in
%                             1 = Supported, 2 = Foam-Unstressed, 3 = Foam-Stressed
%  trial                    - numerical input describing which trial the imaging was performed in
%  uclMeasurements          - [ UCL length, UCL Thickness, UCL Space, Ulnohumeral Gap ]; all in mm
%  status                   - array describing whether or not all of the
%                             necessary .mat files are located in the current folder
%  studyName                - string describing which UCL research study the data is from
%  subjectNumName           - string describing which participant the data is from
%  collectionName           - string describing which imaging session the data is from
%  armName                  - string describing which arm the current data is from
%  conditionName            - string describing which condition the imaging was performed in
%  trialName                - string describing which trial the imaging was performed in
%  participantDataDialog    - dialog box showing current participant data
%  duplicatedTrial          - 0 if unique trial being processed
%                             1 if ducplicate trial being processed
%  processedRow             - row of processedData containint original data for that trial
%  replaceTrialAnswer       - user response whether or not to replace original trial
%  indDataMatFileName       - string containing file name of appropriate indData mat file
%  indDataRow               - appropriate row to place ucl measurements in in indData matrix
%  indDataCols              - appropriate columns to place ucl measurements in indData matrix
%  indDataMatFile           - struct containing indData mat file
%  subjectField             - string containing appropriate field name for specific participant
%  sessionAvgsMatFileName   - string containint file name of appropriate sessionAvgs mat file
%  viewAnalysisAnswer       - user response whether or not to view updated UCL research analysis
%  processAnotherAnswer     - user response whether or not to process data from another UCL image
%  
%  


%% Initialize Variables
subjectChoiceString = cell(100,1);
dataSetChoice = [];

%% Check for mat files

%  Check if each of the mat files are in the current folder.
status = NaN(8,1);
[status(1),~] = system('dir uclBaseIndData.mat');
[status(2),~] = system('dir uclBaseSessionAvgs.mat');
[status(3),~] = system('dir uclNormIndData.mat');
[status(4),~] = system('dir uclNormSessionAvgs.mat');
[status(5),~] = system('dir uclRelyIndData.mat');
[status(6),~] = system('dir uclRelySessionAvgs.mat');
[status(7),~] = system('dir uclTestIndData.mat');
[status(8),~] = system('dir uclTestSessionAvgs.mat');

% Ask user if they want to create blank .mat files.
% If not, halt program and throw error message
if sum(status) ~= 0;
    matErrorAnswer = questdlg('Necessary .mat files not found in current folder! Would you like to create blank .mat files in the current folder?','.mat Files Not Found!','Create Blank .mat Files','Quit Program','Quit Program');
    if strcmp(matErrorAnswer,'Create Blank .mat Files')
        run createUCLMatFiles
    else error('curranFinalProject:matFilesNotFoundInCurrentFolder',...
            '\nProgram halted by user.\nPlease move necessary .mat files to current folder or run createUCLMatFiles.m')
    end
end


%% Load sample data and Processed Data
% Load data
sampleData = importCurranSampleData('curranFinalProjectSampleData.csv','curranFinalProjectSampleData','A1:J10000');

[status,~] = system('dir curranFinalProjectProcessedData.csv');
if isequal(status,1)
    processedDataErrorAnswer = questdlg('curranFinalProjectProcessedData.csv not found in current folder! Would you like to create csv file to store processed data?','processedData Not Found!','Create csv File','Quit Program','Quit Program');
    if strcmp(processedDataErrorAnswer,'Create csv File')
        csvwrite('curranFinalProjectProcessedData.csv',NaN(1,10));
    else error('curranFinalProject:processedDataNotFoundInCurrentFolder',...
            '\nProgram halted by user.\nPlease move curranFinalProjectProcessedData file to current folder')
    end    
end

processedData = importCurranSampleData('curranFinalProjectProcessedData.csv','curranFinalProjectProcessedData','A1:J10000');


%% Ask user if they would like to use a sample collection or enter new data
customDataAnswer = questdlg('Would you to process existing data or enter a custom set of data?','Custom Data?','Custom Data','Sample Data','Sample Data');

% User inputs custom data set
if strcmp(customDataAnswer,'Custom Data')
   imageData = uclAnalysisCustomDataEntry;
else
    % User selects sample participant from data set
    for i = 1:size(sampleData,1)
        subjectChoiceString(i) = {strjoin({'Sample','Collection',num2str(i)})};
    end
    
    while isequal(dataSetChoice,[])
        dataSetChoice = listdlg('PromptString','Please select a sample participant:','SelectionMode','single','ListSize',[350,425],'ListString',subjectChoiceString);
        if  isequal(dataSetChoice,[])
            uiwait(errordlg('No sample participant selected. Please select a sample participant.'))
        end
    end

    % Pull that sample participant's data from data set and sort into appropriate variables
    imageData = sampleData(dataSetChoice,:);

end

% Pull UCL measurements out of imageData
uclMeasurements = imageData(7:10);

% check if all variables have appropriate values


%% Run uclImageDataDecoder to define strings for various inputs .mat file properties

[ studyName, collectionName, conditionName, trialName, armName, subjectNumName, indDataMatFileName, indDataRow, indDataCols ] = uclImageDataDecoder( imageData );


%% Display participant data

participantDataDialog = questdlg([{' '};...
            {strjoin({studyName,subjectNumName})};...
            {' '};...
            {collectionName};...
            {armName};...
            {strjoin({conditionName,trialName},', ')};...
            {' '};...
            {'UCL Length:'};...
            {strjoin({sprintf('%0.2f',uclMeasurements(1)),'mm'})};...
            {' '};...
            {'UCL Thickness:'};...
            {strjoin({sprintf('%0.2f',uclMeasurements(2)),'mm'})};...
            {' '};...
            {'UCL Space'};...
            {strjoin({sprintf('%0.2f',uclMeasurements(3)),'mm'})};...
            {' '};...
            {'UH Gap'};...
            {strjoin({sprintf('%0.2f',uclMeasurements(4)),'mm'})};...
            {' '};...
            {' '}],'Current Participant','Process','Quit Program','Quit Program');

        % Halt execution if user selects Quit Program
if strcmp(participantDataDialog,'Quit Program')
     error('curranFinalProject:UserChoseNotToProcess',...
         '\nProgram halted by user.')
end


%%

duplicatedTrial = 0;
% Check to see if Specific Trial entered has already been processed
for processedRow = 1:size(processedData,1)
    if isequal(imageData(1:6),processedData(processedRow,1:6))
        duplicatedTrial = 1;
        replaceTrialAnswer = questdlg('Data for the current trial has already been processed. Would you like to replace the existing trial data?','Replace Trial?','Replace Existing Trial Data','End Program','End Program');
        if strcmp(replaceTrialAnswer,'End Program');
            error('curranFinalProject:UserChoseNotToReplaceTrial',...
            '\nProgram halted by user.')
        end
        break
    end
end


% Replace existing trial data or add trial to bottom of processedData and re-save file

if isequal(duplicatedTrial,1)
   processedData(processedRow,:) = imageData;
   csvwrite('curranFinalProjectProcessedData.csv',processedData);
else
    processedData = [processedData;imageData];
    csvwrite('curranFinalProjectProcessedData.csv',processedData);
end


%% Place UCL Measurements into proper IndData Particpiant Matrix

% Load proper mat file 
indDataMatFile = load(indDataMatFileName);

% Create string to match name of specific field within mat file
subjectField = strcat(studyName(5),lower(studyName(6:8)),subjectNumName);

% Place Measurements into field in proper row,cols
indDataMatFile.(char({subjectField}))(indDataRow,indDataCols) = uclMeasurements;

% ReSave indData Mat File
save(indDataMatFileName,'-struct','indDataMatFile');



%% Update Session Avgs Mat File for study that current data was from

% Assign string of proper Session Avgs Mat File Name
switch imageData(1)
    case 1
        sessionAvgsMatFileName = 'uclBaseSessionAvgs.mat';
    case 2
        sessionAvgsMatFileName = 'uclNormSessionAvgs.mat';
    case 3
        sessionAvgsMatFileName = 'uclRelySessionAvgs.mat';
    case 4
        sessionAvgsMatFileName = 'uclTestSessionAvgs.mat';
end
        
% Run updateSessionAvgs to update and ReSave SessionAvgs Mat File
updateSessionAvgs(indDataMatFileName,sessionAvgsMatFileName);



%% Ask user about additional analysis

viewAnalysisAnswer = questdlg('Would you like to view updated analysis data for the UCL Research Studies?','View Updaated Statistics?','Yes','No','No');
% If user answers yes, run uclDataAnalysistables to display updated means
if isequal(viewAnalysisAnswer,'Yes')
    run uclDataAnalysisTables
end

%% Ask user if they want to process another set of image data

processAnotherAnswer = questdlg('Would you like to process another set of image data?','Process Another?','Yes','No','No');

% If user answers yes, re-start this function
if isequal(processAnotherAnswer,'Yes')
    run curranFinalProject
% If user answers no, display:
else
    disp(' ');
    disp('Analysis complete.');    
    disp(' ');
end 

% end main function
end 


