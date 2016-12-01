function imageData = uclAnalysisCustomDataEntry
%%  uclAnalysisCustomDataEntry
%  
%  Christopher Curran, East Carolina University
%  December 1st, 2016
%  
%  
%  This function will provide a series of dialogs for the user to enter custom
%  ucl image data

%  
%  calling
%  --------
%  uclAnalysisCustomDataEntry
%  
%  
%  inputs
%  --------
%
%  
%  outputs
%  --------
%  imageData
%  
%  
%  other functions called
%  --------
%  
%  
%  variables
%  --------
%  imageData                - 10 element array containing values from user inputs
%  measurements             - 4 cell array containing UCL Measurements input by user
%  lengthTooShortAnswer     - Response to dialog checking if Length measurement is correct
%  lengthTooLongAnswer      - Response to dialog checking if Length measurement is correct
%  newLengthMeasurement     - User input of corrected UCL Length measurement
%  thicknessTooSmallAnswer  - Response to dialog checking if Thickness measurement is correct
%  thicknessTooLargeAnswer  - Response to dialog checking if Thickness measurement is correct
%  newThicknessMeasurement  - User input of corrected UCL Length measurement
%  spaceTooSmallAnswer      - Response to dialog checking if Space measurement is correct
%  spaceTooLargeAnswer      - Response to dialog checking if Space measurement is correct
%  newSpaceMeasurement      - User input of corrected UCL Length measurement
%  gapTooSmallAnswer        - Response to dialog checking if Gap measurement is correct
%  gapTooLargeAnswer        - Response to dialog checking if Gap measurement is correct
%  newGapMeasurement        - User input of corrected UCL Length measurement
%  

%%
% Initialize imageData
imageData = zeros(1,10);

% Select Study
imageData(1) = listdlg('Name','Select Study','PromptString','UCL Research Study:','ListString',{'UCL BASE';'UCL NORM';'UCL RELY';'UCL TEST'},'SelectionMode','single');

% Select Participant
switch imageData(1)
    case 1
        imageData(2) = listdlg('Name','Select Participant','PromptString','Research Participant:','ListString',{num2str((1:17)')},'SelectionMode','single');
    case 2
        imageData(2) = listdlg('Name','Select Participant','PromptString','Research Participant:','ListString',{num2str((1:60)')},'SelectionMode','single');
    case 3
        imageData(2) = listdlg('Name','Select Participant','PromptString','Research Participant:','ListString',{num2str((1:10)')},'SelectionMode','single');
    case 4
        imageData(2) = listdlg('Name','Select Participant','PromptString','Research Participant:','ListString',{num2str((1:5)')},'SelectionMode','single');
end

% Select Collection
switch imageData(1)
    case 1
        imageData(3) = listdlg('Name','Select Collection','PromptString','Imaging Collection:','ListString',{'Pre-Season','In-Season 1','In-Season 2','In-Season 3','In-Season 4','In-Season 5','In-Season 6','In-Season 7','In-Season 8','In-Season 9','In-Season 10','Post-Season'},'SelectionMode','single');
    case 2
        imageData(3) = 1;
    case 3
        imageData(3) = listdlg('Name','Select Collection','PromptString','Imaging Collection:','ListString',{'Day 1','Day 2'},'SelectionMode','single');
    case 4
        imageData(3) = listdlg('Name','Select Collection','PromptString','Imaging Collection:','ListString',{'Collection 1','Collection 2','Collection 3','Collection 4','Collection 5'},'SelectionMode','single');
end

% Select Arm
if isequal(imageData(1),1) && (isequal(imageData(3),2) || isequal(imageData(3),3) || isequal(imageData(3),4) || isequal(imageData(3),5) || isequal(imageData(3),6) || isequal(imageData(3),7) || isequal(imageData(3),8) || isequal(imageData(3),9) || isequal(imageData(3),10) || isequal(imageData(3),11))
    imageData(4) = 1;
else
    imageData(4) = (listdlg('Name','Select Arm','PromptString','Select Arm:','ListString',{'NonThrowing Arm','Throwing Arm'},'SelectionMode','single')-1);
end

% Select Condition
imageData(5) = (listdlg('Name','Select Condition','PromptString','Imaging Condition:','ListString',{'Supported','Foam-Unstressed','Foam-Stressed'},'SelectionMode','single'));

% Select Trial
imageData(6) = (listdlg('Name','Select Trial','PromptString','Trial:','ListString',{'Trial 1','Trial 2','Trial 3'},'SelectionMode','single'));

% Enter UCL Measurements
measurements(1:4) = inputdlg({'UCL Length (mm)','UCL Thickness (mm)','UCL Space (mm)','Ulnohumeral Gap Space (mm)'},...
              'UCL Measurements', [1 25; 1 25; 1 25; 1 25]);
          
% Convert UCL measurements to double and place into imageData
imageData(7:10) = str2num(char(measurements(1:4)));     %%% str2double causes error

%% Check that all UCL Measurements seem reasonable
% UCL Length Too Short
while imageData(7) < 15.00
        lengthTooShortAnswer = questdlg(['The UCL Length of', sprintf('% 4.2f',imageData(7)), 'mm entered appears to be rather short. Is this measurement correct?'],'UCL Length Appears Short','Measurement Correct','Re-Enter Measurement','Re-Enter Measurement');
    if strcmp(lengthTooShortAnswer,'Re-Enter Measurement')
        newLengthMeasurement = inputdlg({'Re-Enter UCL Length:'},'New UCL Length Measurement', [1 35]);
        imageData(7) = str2num(char(newLengthMeasurement));     %%% str2double causes error
    else
        break
    end
end

% UCL Length Too Long
while imageData(7) > 25.00
        lengthTooLongAnswer = questdlg(['The UCL Length of', sprintf('% 4.2f',imageData(7)), 'mm entered appears to be rather long. Is this measurement correct?'],'UCL Length Appears Long','Measurement Correct','Re-Enter Measurement','Re-Enter Measurement');
    if strcmp(lengthTooLongAnswer,'Re-Enter Measurement')
        newLengthMeasurement = inputdlg({'Re-Enter UCL Length:'},'New UCL Length Measurement', [1 35]);
        imageData(7) = str2num(char(newLengthMeasurement));     %%% str2double causes error
    else
        break
    end
end

% UCL Thickness Too Small
while imageData(8) < 0.90
        thicknessTooSmallAnswer = questdlg(['The UCL Thickness of', sprintf('% 4.2f',imageData(7)), 'mm entered appears to be rather small. Is this measurement correct?'],'UCL Thickness Appears Small','Measurement Correct','Re-Enter Measurement','Re-Enter Measurement');
    if strcmp(thicknessTooSmallAnswer,'Re-Enter Measurement')
        newThicknessMeasurement = inputdlg({'Re-Enter UCL Thickness:'},'New UCL Thickness Measurement', [1 35]);
        imageData(8) = str2num(char(newThicknessMeasurement));      %%% str2double causes error
    else
        break
    end
end

% UCL Thickness Too Large
while imageData(8) > 1.75
        thicknessTooLargeAnswer = questdlg(['The UCL Thickness of', sprintf('% 4.2f',imageData(7)), 'mm entered appears to be rather large. Is this measurement correct?'],'UCL Thickness Appears Large','Measurement Correct','Re-Enter Measurement','Re-Enter Measurement');
    if strcmp(thicknessTooLargeAnswer,'Re-Enter Measurement')
        newThicknessMeasurement = inputdlg({'Re-Enter UCL Length:'},'New UCL Length Measurement', [1 35]);
        imageData(8) = str2num(char(newThicknessMeasurement));  %%% str2double causes error
    else
        break
    end
end

% UCL Space Too Small
while imageData(9) < 2.00
        spaceTooSmallAnswer = questdlg(['The UCL Space of', sprintf('% 4.2f',imageData(7)), 'mm entered appears to be rather small. Is this measurement correct?'],'UCL Space Appears Small','Measurement Correct','Re-Enter Measurement','Re-Enter Measurement');
    if strcmp(spaceTooSmallAnswer,'Re-Enter Measurement')
        newSpaceMeasurement = inputdlg({'Re-Enter UCL Space:'},'New UCL Space Measurement', [1 35]);
        imageData(9) = str2num(char(newSpaceMeasurement));      %%% str2double causes error
    else
        break
    end
end

% UCL Space Too Large
while imageData(9) > 7.00
        spaceTooLargeAnswer = questdlg(['The UCL Space of', sprintf('% 4.2f',imageData(7)), 'mm entered appears to be rather large. Is this measurement correct?'],'UCL Space Appears Large','Measurement Correct','Re-Enter Measurement','Re-Enter Measurement');
    if strcmp(spaceTooLargeAnswer,'Re-Enter Measurement')
        newSpaceMeasurement = inputdlg({'Re-Enter UCL Length:'},'New UCL Length Measurement', [1 35]);
        imageData(9) = str2num(char(newSpaceMeasurement));      %%% str2double causes error
    else
        break
    end
end

% UH Gap Too Small
while imageData(10) < 2.00
        gapTooSmallAnswer = questdlg(['The UH Gap of', sprintf('% 4.2f',imageData(7)), 'mm entered appears to be rather small. Is this measurement correct?'],'UH Gap Appears Small','Measurement Correct','Re-Enter Measurement','Re-Enter Measurement');
    if strcmp(gapTooSmallAnswer,'Re-Enter Measurement')
        newGapMeasurement = inputdlg({'Re-Enter UH Gap:'},'New UH Gap Measurement', [1 35]);
        imageData(10) = str2num(char(newGapMeasurement));       %%% str2double causes error
    else
        break
    end
end

% UH Gap Too Large
while imageData(10) > 7.00
        gapTooLargeAnswer = questdlg(['The UH Gap of', sprintf('% 4.2f',imageData(7)), 'mm entered appears to be rather large. Is this measurement correct?'],'UH Gap Appears Large','Measurement Correct','Re-Enter Measurement','Re-Enter Measurement');
    if strcmp(gapTooLargeAnswer,'Re-Enter Measurement')
        newGapMeasurement = inputdlg({'Re-Enter UH Length:'},'New UH Length Measurement', [1 35]);
        imageData(10) = str2num(char(newGapMeasurement));       %%% str2double causes error
    else
        break
    end
end

%%
% end function
end
