function [ studyName, collectionName, conditionName, trialName, armName, subjectNumName, indDataMatFileName, indDataRow, indDataCols ] = uclImageDataDecoder( imageData )
%%  uclImageDataDecoder
%  
%  Christopher Curran, East Carolina University
%  December 1st, 2016
%  
%  This function will use a series of switches to create string variables 
%  for the variables needed to process UCL image data in the function curranFinalProject

%  
%  calling
%  --------
%  uclImageDataDecoder
%  
%  
%  inputs
%  --------
%  imageData                - 10 element array containing numerical data from UCL image 
%
%  
%  outputs
%  --------
%  studyName                - string describing which UCL research study the data is from
%  subjectNumName           - string describing which participant the data is from
%  collectionName           - string describing which imaging session the data is from
%  armName                  - string describing which arm the current data is from
%  conditionName            - string describing which condition the imaging was performed in
%  trialName                - string describing which trial the imaging was performed in
%  indDataMatFileName       - string containing the name of the proper Ind Data Mat File to load
%  indDataRow               - proper row for the current image data to be placed in Ind Data File
%  indDataCols              - proper columns for the current image data to be placed in Ind Data File
%  
%  
%  other functions called
%  --------
%  
%  
%  subfunctions called
%  --------
%  
%  
%  variables
%  --------
%  study                    - numerical input describing which UCL study data is from
%                             1 = UCL BASE, 2 = UCL NORM, 3 = UCL RELY, 4 = UCL TEST
%  subjectNum               - numerical input decsribing the participant's number
%  collection               - numerical input describing which imaging session the data is from
%  arm                      - numerical input describing which arm the data is from
%                             0 = Non-Throwing Arm, 1 = Throwing Arm
%  condition                - numerical input describing which condition the imaging was performed in
%                             1 = Supported, 2 = Foam-Unstressed, 3 = Foam-Stressed
%  trial                    - numerical input describing which trial the imaging was performed in
%  indDataMatFileName       - string containing the name of the proper Ind Data Mat File to load
%  indDataRow               - proper row for the current image data to be placed in Ind Data File
%  indDataCols              - proper columns for the current image data to be placed in Ind Data File
%  studyName                - string describing which UCL research study the data is from
%  subjectNumName           - string describing which participant the data is from
%  collectionName           - string describing which imaging session the data is from
%  armName                  - string describing which arm the current data is from
%  conditionName            - string describing which condition the imaging was performed in
%  trialName                - string describing which trial the imaging was performed in
%  


%% Sort and Pre-set variables

study = imageData(1);
subjectNum = imageData(2);
collection = imageData(3);
arm = imageData(4);
condition = imageData(5);
trial = imageData(6);

indDataRow = 0;
indDataCols = [1 2 3 4];

%% Switches to create string variables and fill indDataRow and indDataCols

switch study
    % UCL BASE
    case 1
        indDataMatFileName = 'uclBaseIndData.mat';
        studyName = 'UCL BASE';
        switch collection
            case 1
                indDataRow = 1;
                collectionName = 'Pre-Season';
            case 2
                indDataRow = 3;
                collectionName = 'In-Season 1';
            case 3
                indDataRow = 4;
                collectionName = 'In-Season 2';
            case 4
                indDataRow = 5;
                collectionName = 'In-Season 3';
            case 5
                indDataRow = 6;
                collectionName = 'In-Season 4';
            case 6
                indDataRow = 7;
                collectionName = 'In-Season 5';
            case 7
                indDataRow = 8;
                collectionName = 'In-Season 6';
            case 8
                indDataRow = 9;
                collectionName = 'In-Season 7';
            case 9
                indDataRow = 10;
                collectionName = 'In-Season 8';
            case 10
                indDataRow = 11;
                collectionName = 'In-Season 9';
            case 11
                indDataRow = 12;
                collectionName = 'In-Season 10';
            case 12
                indDataRow = 13;
                collectionName = 'Post-Season';
        end
        
    % UCL NORM    
    case 2
        indDataMatFileName = 'uclNormIndData.mat';
        indDataRow = 1;
        studyName = 'UCL NORM';
        collectionName = 'Single Collection';
        
    % UCL RELY
    case 3
        indDataMatFileName = 'uclRelyIndData.mat';
        studyName = 'UCL RELY';
        switch collection
            case 1
                indDataRow = 1;
                collectionName = 'Day 1';
            case 2
                indDataRow = 3;
                collectionName = 'Day 2';
        end
        
    % UCL TEST    
    case 4
        indDataMatFileName = 'uclTestIndData.mat';
        studyName = 'UCL TEST';
        switch collection
            case 1
                indDataRow = 1;
                collectionName = 'Collection 1';
            case 2
                indDataRow = 3;
                collectionName = 'Collection 2';
            case 3
                indDataRow = 5;
                collectionName = 'Collection 3';
            case 4
                indDataRow = 7;
                collectionName = 'Collection 4';
            case 5
                indDataRow = 9;
                collectionName = 'Collection 5';
        end
end

% adjust indDataCols based on the condition and trial of the image
switch condition
    case 1
        conditionName = 'Supported';
    case 2
        indDataCols = indDataCols + 12;
        conditionName = 'Foam-Unstressed';
    case 3
        indDataCols = indDataCols + 24;
        conditionName = 'Foam-Stressed';
end

% create trialName string 
switch trial
    case 1
        trialName = 'Trial 1';
    case 2
        indDataCols = indDataCols + 4;
        trialName = 'Trial 2';
    case 3
        indDataCols = indDataCols + 8;
        trialName = 'Trial 3';
end

% adjust indDataRow based on which arm was imaged
switch arm
    case 0
        armName = 'Non-Throwing Arm';
        indDataRow = indDataRow + 1;
    case 1
        armName = 'Throwing Arm';
end

% create subjectNumName string
if subjectNum < 10
    subjectNumName = strcat('00',num2str(subjectNum));
else
    subjectNumName = strcat('0',num2str(subjectNum));
end

% end function
end
