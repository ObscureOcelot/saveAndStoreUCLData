%%  createUCLMatFiles
%  
%  Christopher Curran, East Carolina University
%  December 1st, 2016
%  
%  
%  This script will create eight separate .mat files
%  These .mat files will be used to store participant data in any of the
%  four UCL research studies: UCL BASE, UCL NORM, UCL RELY, UCL TEST.
%  
%  There will be four .mat files to contain the raw data of each
%  participant for each of the particular studies.
%  There will be four .mat files containing the averages of each
%  measurement taken per collection in the research studies.
  
%  The 36 columns of data will be organized in groups of 4 (length,
%  thickness, space, UH Gap). Three sets of these four columns for each
%  condition will make three groups of 12 columns. The first set of twelve
%  correlates to the Supported condition, the second to the Foam-Unstressed
%  condition, the third to the Foam-Stressed condition.
%
%  For UCL NORM, UCL RELY, and UCL TEST, odd number rows correlate to the
%  participant's throwing arm, even number rows to the participant's non
%  throwing arm. Two rows for each imaging session
%  For UCL BASE, the first two rows and the 13th and 14th rows follow the same
%  pattern for the participant's Pre- and Post-Season imaging sessions, respectively.
%  Rows 3-12 contain data for the participant's throwing arm dor each
%  In-Season imaging collection.
%  
%  For the SessionAvgs mat files, column 1, 7 and 13 will show 1 when all 3 trials
%  have been analyzed for that condition for that participant. For the GroupAvgs matrix,
%  columns 1, 7, and 13 will show the total number of participants that
%  have all 3 trials processed for each condition. 
%  Columns 2, 8, and 14 will show the number of trials that have been processed so far
%  for that participant in that condition. In the GroupAvgs matrix, they will show the total
%  number of trials processed for that condition in the particular research study 
%  

%  Each of the mat files will be filled with NaN initially.
%  
%  calling
%  --------
%  createUCLMatFiles
%  
%  
%  inputs
%  --------
%  
%
%  
%  outputs - creates the following .mat files:
%  --------
%  uclBaseIndData
%  uclBaseSessionAvgs
%  uclNormIndData
%  uclNormSessionAvgs
%  uclRelyIndData
%  uclRelySessionAvgs
%  uclTestIndData
%  uclTestSessionAvgs
%  
%  
%  other functions called
%  --------
%  
%  
%  variables
%  --------
%  uclBaseIndData       - mat file containing individual data for UCL BASE participants
%  uclNormIndData       - mat file containing individual data for UCL NORM participants
%  uclRelyIndData       - mat file containing individual data for UCL RELY participants
%  uclTestIndData       - mat file containing individual data for UCL TEST participants
%  uclBaseSessionAvgs   - mat file containing participant and group mean values for UCL BASE
%  uclNormSessionAvgs   - mat file containing participant and group mean values for UCL NORM
%  uclRelySessionAvgs   - mat file containing participant and group mean values for UCL RELY
%  uclTestSessionAvgs   - mat file containing participant and group mean values for UCL TEST
%  
%  


%% Initialize mat files

% Create individual participant data mat files in current folder
uclBaseIndData = matfile('uclBaseIndData','Writable',true);
uclNormIndData = matfile('uclNormIndData','Writable',true);
uclRelyIndData = matfile('uclRelyIndData','Writable',true);
uclTestIndData = matfile('uclTestIndData','Writable',true);

% Creae imaging session average mat files in current folder
uclBaseSessionAvgs = matfile('uclBaseSessionAvgs','Writable',true);
uclNormSessionAvgs = matfile('uclNormSessionAvgs','Writable',true);
uclRelySessionAvgs = matfile('uclRelySessionAvgs','Writable',true);
uclTestSessionAvgs = matfile('uclTestSessionAvgs','Writable',true);

%% Fill IndData mat files 

% Fill uclBaseIndData with a 14x36 NaN matrix for each of the 17 participants
uclBaseIndData.Base001 = NaN(14,36);
uclBaseIndData.Base002 = NaN(14,36);
uclBaseIndData.Base003 = NaN(14,36);
uclBaseIndData.Base004 = NaN(14,36);
uclBaseIndData.Base005 = NaN(14,36);
uclBaseIndData.Base006 = NaN(14,36);
uclBaseIndData.Base007 = NaN(14,36);
uclBaseIndData.Base008 = NaN(14,36);
uclBaseIndData.Base009 = NaN(14,36);
uclBaseIndData.Base010 = NaN(14,36);
uclBaseIndData.Base011 = NaN(14,36);
uclBaseIndData.Base012 = NaN(14,36);
uclBaseIndData.Base013 = NaN(14,36);
uclBaseIndData.Base014 = NaN(14,36);
uclBaseIndData.Base015 = NaN(14,36);
uclBaseIndData.Base016 = NaN(14,36);
uclBaseIndData.Base017 = NaN(14,36);


% Fill uclNormIndData with a 2x36 NaN matrix for each of the 60 participants
uclNormIndData.Norm001 = NaN(2,36);
uclNormIndData.Norm002 = NaN(2,36);
uclNormIndData.Norm003 = NaN(2,36);
uclNormIndData.Norm004 = NaN(2,36);
uclNormIndData.Norm005 = NaN(2,36);
uclNormIndData.Norm006 = NaN(2,36);
uclNormIndData.Norm007 = NaN(2,36);
uclNormIndData.Norm008 = NaN(2,36);
uclNormIndData.Norm009 = NaN(2,36);
uclNormIndData.Norm010 = NaN(2,36);
uclNormIndData.Norm011 = NaN(2,36);
uclNormIndData.Norm012 = NaN(2,36);
uclNormIndData.Norm013 = NaN(2,36);
uclNormIndData.Norm014 = NaN(2,36);
uclNormIndData.Norm015 = NaN(2,36);
uclNormIndData.Norm016 = NaN(2,36);
uclNormIndData.Norm017 = NaN(2,36);
uclNormIndData.Norm018 = NaN(2,36);
uclNormIndData.Norm019 = NaN(2,36);
uclNormIndData.Norm020 = NaN(2,36);
uclNormIndData.Norm021 = NaN(2,36);
uclNormIndData.Norm022 = NaN(2,36);
uclNormIndData.Norm023 = NaN(2,36);
uclNormIndData.Norm024 = NaN(2,36);
uclNormIndData.Norm025 = NaN(2,36);
uclNormIndData.Norm026 = NaN(2,36);
uclNormIndData.Norm027 = NaN(2,36);
uclNormIndData.Norm028 = NaN(2,36);
uclNormIndData.Norm029 = NaN(2,36);
uclNormIndData.Norm030 = NaN(2,36);
uclNormIndData.Norm031 = NaN(2,36);
uclNormIndData.Norm032 = NaN(2,36);
uclNormIndData.Norm033 = NaN(2,36);
uclNormIndData.Norm034 = NaN(2,36);
uclNormIndData.Norm035 = NaN(2,36);
uclNormIndData.Norm036 = NaN(2,36);
uclNormIndData.Norm037 = NaN(2,36);
uclNormIndData.Norm038 = NaN(2,36);
uclNormIndData.Norm039 = NaN(2,36);
uclNormIndData.Norm040 = NaN(2,36);
uclNormIndData.Norm041 = NaN(2,36);
uclNormIndData.Norm042 = NaN(2,36);
uclNormIndData.Norm043 = NaN(2,36);
uclNormIndData.Norm044 = NaN(2,36);
uclNormIndData.Norm045 = NaN(2,36);
uclNormIndData.Norm046 = NaN(2,36);
uclNormIndData.Norm047 = NaN(2,36);
uclNormIndData.Norm048 = NaN(2,36);
uclNormIndData.Norm049 = NaN(2,36);
uclNormIndData.Norm050 = NaN(2,36);
uclNormIndData.Norm051 = NaN(2,36);
uclNormIndData.Norm052 = NaN(2,36);
uclNormIndData.Norm053 = NaN(2,36);
uclNormIndData.Norm054 = NaN(2,36);
uclNormIndData.Norm055 = NaN(2,36);
uclNormIndData.Norm056 = NaN(2,36);
uclNormIndData.Norm057 = NaN(2,36);
uclNormIndData.Norm058 = NaN(2,36);
uclNormIndData.Norm059 = NaN(2,36);
uclNormIndData.Norm060 = NaN(2,36);


% Fill uclRelyIndData with a 4x36 NaN matrix for each of the 60 participants
uclRelyIndData.Rely001 = NaN(4,36);
uclRelyIndData.Rely002 = NaN(4,36);
uclRelyIndData.Rely003 = NaN(4,36);
uclRelyIndData.Rely004 = NaN(4,36);
uclRelyIndData.Rely005 = NaN(4,36);
uclRelyIndData.Rely006 = NaN(4,36);
uclRelyIndData.Rely007 = NaN(4,36);
uclRelyIndData.Rely008 = NaN(4,36);
uclRelyIndData.Rely009 = NaN(4,36);
uclRelyIndData.Rely010 = NaN(4,36);


% Fill uclTestIndData with a 4x36 NaN matrix for each of the 60 participants
uclTestIndData.Test001 = NaN(10,36);
uclTestIndData.Test002 = NaN(10,36);
uclTestIndData.Test003 = NaN(10,36);
uclTestIndData.Test004 = NaN(10,36);
uclTestIndData.Test005 = NaN(10,36);


%% Fill IndData mat files 

% Fill uclSessionAvgs with a 14x18 matrix for BaseGroup and each of the 17 participants
uclBaseSessionAvgs.BaseGroupAvgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base001Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base002Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base003Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base004Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base005Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base006Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base007Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base008Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base009Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base010Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base011Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base012Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base013Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base014Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base015Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base016Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];
uclBaseSessionAvgs.Base017Avgs = [zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4),zeros(14,2),NaN(14,4)];


% Fill uclNormSessionAvgs with a 2x18 matrix for NormGroup and each of the 40 participants
uclNormSessionAvgs.NormGroupAvgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm001Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm002Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm003Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm004Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm005Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm006Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm007Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm008Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm009Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm010Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm011Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm012Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm013Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm014Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm015Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm016Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm017Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm018Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm019Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm020Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm021Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm022Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm023Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm024Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm025Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm026Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm027Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm028Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm029Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm030Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm031Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm032Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm033Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm034Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm035Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm036Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm037Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm038Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm039Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm040Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm041Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm042Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm043Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm044Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm045Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm046Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm047Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm048Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm049Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm050Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm051Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm052Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm053Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm054Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm055Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm056Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm057Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm058Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm059Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];
uclNormSessionAvgs.Norm040Avgs = [zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4),zeros(2,2),NaN(2,4)];


% Fill uclRelySessionAvgs with a 4x18 matrix for Norm Group and each of the 10 participants
uclRelySessionAvgs.RelyGroupAvgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely001Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely002Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely003Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely004Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely005Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely006Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely007Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely008Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely009Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];
uclRelySessionAvgs.Rely010Avgs = [zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4),zeros(4,2),NaN(4,4)];


% Fill uclTestSessionAvgs with a 10x18 matrix for TestGroup each of the 5 Participants
uclTestSessionAvgs.TestGroupAvgs = [zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4)];
uclTestSessionAvgs.Test001Avgs = [zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4)];
uclTestSessionAvgs.Test002Avgs = [zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4)];
uclTestSessionAvgs.Test003Avgs = [zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4)];
uclTestSessionAvgs.Test004Avgs = [zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4)];
uclTestSessionAvgs.Test005Avgs = [zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4),zeros(10,2),NaN(10,4)];
