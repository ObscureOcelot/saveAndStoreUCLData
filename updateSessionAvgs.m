function updateSessionAvgs(indDataMatFileName,sessionAvgsMatFileName)
%%  updateSessionAvgs
%  
%  Christopher Curran, East Carolina University
%  December 1st, 2016
%  
%  This function will update and resave the session average mat file for 
%  the ucl research study that data is currently being entered for
%  
%  This function was originally written as part of the final project for
%  KINE 6803 in Fall 2016

%  
%  calling
%  --------
%  updateSessionAvgs
%  
%  
%  inputs
%  --------
%  indDataMatFileName       - string containing the name of the proper Ind Data Mat File to load
%  sessionAvgsMatFileName   - string containing the name of the proper session avgs mat file to load
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
%  
%  
%  variables
%  --------
%  indDataMatFileName       - string containing name of indData mat file to be loaded
%  sessionAvgsMatFileName   - string containing name of sessionAvgs mat file to be loaded
%  indDataMatFile           - struct containing indData mat file
%  sessionAvgsMatFile       - struct containing sessionAvgs mat file
%  subjectNames             - fields of indDataMatFile containing individual particicpant numbers
%  avgsNames                - fields of sessionAvgsMatFile containing individual and group means sheets
%  tempArray                - temporary array used to store data as group means are calculated
%  
%  

%% load appropriate individual data and avgs mat files

indDataMatFile = load(indDataMatFileName);
sessionAvgsMatFile = load(sessionAvgsMatFileName);

% Get fieldnames from appropriate individual data and average .mat files
subjectNames = fieldnames(indDataMatFile);
avgsNames = fieldnames(sessionAvgsMatFile);

%% Update means for individual participants

for i = 1:length(subjectNames)
    for j = 1:size(sessionAvgsMatFile.(char(avgsNames(1))),1)
        % Supported Averages
        if isequal(sum(isnan(indDataMatFile.(char(subjectNames(i)))(j,1:12))),0)
            sessionAvgsMatFile.(char(avgsNames(i)))(j,1) = 1;
        else
            sessionAvgsMatFile.(char(avgsNames(i)))(j,1) = 0;
        end
        sessionAvgsMatFile.(char(avgsNames(i)))(j,2) = ((12 - sum(isnan(indDataMatFile.(char(subjectNames(i)))(j,1:12))))/4);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,3) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,1),indDataMatFile.(char(subjectNames(i)))(j,5),indDataMatFile.(char(subjectNames(i)))(j,9)]);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,4) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,2),indDataMatFile.(char(subjectNames(i)))(j,6),indDataMatFile.(char(subjectNames(i)))(j,10)]);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,5) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,3),indDataMatFile.(char(subjectNames(i)))(j,7),indDataMatFile.(char(subjectNames(i)))(j,11)]);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,6) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,4),indDataMatFile.(char(subjectNames(i)))(j,8),indDataMatFile.(char(subjectNames(i)))(j,12)]);
        
        % Foam-Unstressed Averages
        if isequal(sum(isnan(indDataMatFile.(char(subjectNames(i)))(j,13:24))),0)
            sessionAvgsMatFile.(char(avgsNames(i)))(j,7) = 1;
        else
            sessionAvgsMatFile.(char(avgsNames(i)))(j,7) = 0;
        end
        sessionAvgsMatFile.(char(avgsNames(i)))(j,8) = ((12 - sum(isnan(indDataMatFile.(char(subjectNames(i)))(j,13:24))))/4);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,9) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,13),indDataMatFile.(char(subjectNames(i)))(j,17),indDataMatFile.(char(subjectNames(i)))(j,21)]);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,10) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,14),indDataMatFile.(char(subjectNames(i)))(j,18),indDataMatFile.(char(subjectNames(i)))(j,22)]);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,11) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,15),indDataMatFile.(char(subjectNames(i)))(j,19),indDataMatFile.(char(subjectNames(i)))(j,23)]);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,12) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,16),indDataMatFile.(char(subjectNames(i)))(j,20),indDataMatFile.(char(subjectNames(i)))(j,24)]);
        
        % Foam-Stressed Averages
        if isequal(sum(isnan(indDataMatFile.(char(subjectNames(i)))(j,25:36))),0)
            sessionAvgsMatFile.(char(avgsNames(i)))(j,13) = 1;
        else
            sessionAvgsMatFile.(char(avgsNames(i)))(j,13) = 0;
        end
        sessionAvgsMatFile.(char(avgsNames(i)))(j,14) = ((12 - sum(isnan(indDataMatFile.(char(subjectNames(i)))(j,25:36))))/4);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,15) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,25),indDataMatFile.(char(subjectNames(i)))(j,29),indDataMatFile.(char(subjectNames(i)))(j,33)]);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,16) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,26),indDataMatFile.(char(subjectNames(i)))(j,30),indDataMatFile.(char(subjectNames(i)))(j,34)]);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,17) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,27),indDataMatFile.(char(subjectNames(i)))(j,31),indDataMatFile.(char(subjectNames(i)))(j,35)]);
        sessionAvgsMatFile.(char(avgsNames(i)))(j,18) = nanmean([indDataMatFile.(char(subjectNames(i)))(j,28),indDataMatFile.(char(subjectNames(i)))(j,32),indDataMatFile.(char(subjectNames(i)))(j,36)]);
    end
end


%% update Group Means matrix
% Update means for ucl measurements
tempArray = NaN(length(subjectNames),1);
for i  = 1:size(sessionAvgsMatFile.(char(avgsNames(1))),1)
     for j = [3:6,9:12,15:18];
         for k = 1:length(subjectNames)
         tempArray(k) = sessionAvgsMatFile.(char(avgsNames(k)))(i,j);
         end
     sessionAvgsMatFile.(char(avgsNames(length(avgsNames))))(i,j) = nanmean(tempArray);
     end
end

% Update number of trials and completed participants
tempArray = NaN(length(subjectNames),1);
for i  = 1:size(sessionAvgsMatFile.(char(avgsNames(1))),1)
     for j = [1,2,7,8,13,14]
         for k = 1:length(subjectNames)
         tempArray(k) = sessionAvgsMatFile.(char(avgsNames(k)))(i,j);
         end
     sessionAvgsMatFile.(char(avgsNames(length(avgsNames))))(i,j) = sum(tempArray);
     end
end

% ReSave SessionAvgs Mat File
save(sessionAvgsMatFileName,'-struct','sessionAvgsMatFile');

% end of function
end