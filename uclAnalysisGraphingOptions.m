function varargout = uclAnalysisGraphingOptions(varargin)
% UCLANALYSISGRAPHINGOPTIONS MATLAB code for uclAnalysisGraphingOptions.fig
%      UCLANALYSISGRAPHINGOPTIONS, by itself, creates a new UCLANALYSISGRAPHINGOPTIONS or raises the existing
%      singleton*.
%
%      H = UCLANALYSISGRAPHINGOPTIONS returns the handle to a new UCLANALYSISGRAPHINGOPTIONS or the handle to
%      the existing singleton*.
%
%      UCLANALYSISGRAPHINGOPTIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UCLANALYSISGRAPHINGOPTIONS.M with the given input arguments.
%
%      UCLANALYSISGRAPHINGOPTIONS('Property','Value',...) creates a new UCLANALYSISGRAPHINGOPTIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before uclAnalysisGraphingOptions_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to uclAnalysisGraphingOptions_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help uclAnalysisGraphingOptions

% Last Modified by GUIDE v2.5 18-Nov-2016 09:09:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @uclAnalysisGraphingOptions_OpeningFcn, ...
                   'gui_OutputFcn',  @uclAnalysisGraphingOptions_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before uclAnalysisGraphingOptions is made visible.
function uclAnalysisGraphingOptions_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to uclAnalysisGraphingOptions (see VARARGIN)

% Choose default command line output for uclAnalysisGraphingOptions
handles.output = hObject;

% Create zeros arrays for graphs2Plot and graphs2Save
handles.graphs2Plot = zeros(1,10);
handles.graphs2Save = zeros(1,10);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes uclAnalysisGraphingOptions wait for user response (see UIRESUME)
uiwait%(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = uclAnalysisGraphingOptions_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.outputNow == 1
    varargout{1} = handles.graphs2Plot;
    varargout{2} = handles.graphs2Save;
    delete(hObject)
end


% --- Executes on button press in graphs2Plot_1.
function graphs2Plot_1_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(1) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_1


% --- Executes on button press in graphs2Plot_2.
function graphs2Plot_2_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_2

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(2) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Plot_3.
function graphs2Plot_3_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_3

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(3) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Plot_4.
function graphs2Plot_4_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_4

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(4) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Plot_5.
function graphs2Plot_5_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_5

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(5) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Plot_6.
function graphs2Plot_6_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_6

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(6) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in graphs2Plot_7.
function graphs2Plot_7_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_7

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(7) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Plot_8.
function graphs2Plot_8_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_8

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(8) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Plot_9.
function graphs2Plot_9_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_9

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(9) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Plot_10.
function graphs2Plot_10_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Plot_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Plot_10

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Plot(10) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_1.
function graphs2Save_1_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_1

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(1) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_2.
function graphs2Save_2_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_2

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(2) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_3.
function graphs2Save_3_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_3

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(3) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_4.
function graphs2Save_4_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_4

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(4) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_5.
function graphs2Save_5_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_5

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(5) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_6.
function graphs2Save_6_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_6

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(6) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_7.
function graphs2Save_7_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_7

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(7) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_8.
function graphs2Save_8_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_8

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(8) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_9.
function graphs2Save_9_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_9

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(9) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in graphs2Save_10.
function graphs2Save_10_Callback(hObject, eventdata, handles)
% hObject    handle to graphs2Save_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphs2Save_10

% Assign toggle value to corresponding place in graphs2Plot
handles.graphs2Save(10) = get(hObject,'Value');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in CompleteButton.
function CompleteButton_Callback(hObject, eventdata, handles)
% hObject    handle to CompleteButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume
handles.outputNow = 1;


% Update handles structure
guidata(hObject, handles);



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
