function varargout = proje_v1(varargin)
% PROJE_V1 MATLAB code for proje_v1.fig
%      PROJE_V1, by itself, creates a new PROJE_V1 or raises the existing
%      singleton*.
%
%      H = PROJE_V1 returns the handle to a new PROJE_V1 or the handle to
%      the existing singleton*.
%
%      PROJE_V1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJE_V1.M with the given input arguments.
%
%      PROJE_V1('Property','Value',...) creates a new PROJE_V1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proje_v1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proje_v1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proje_v1

% Last Modified by GUIDE v2.5 08-Feb-2021 20:12:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proje_v1_OpeningFcn, ...
                   'gui_OutputFcn',  @proje_v1_OutputFcn, ...
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


% --- Executes just before proje_v1 is made visible.
function proje_v1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
global p
p.NLdata=[];
p.Fdata=[];
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes proje_v1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = proje_v1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in k_mat.
function k_mat_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile();
if isequal([FileName,PathName],[0,0])
    handles.K=0;
    return
else
    File = fullfile(PathName,FileName);
    handles.K=importdata(File);
end
handles.K=matrixeditor(handles.K);
guidata(hObject,handles);

% --- Executes on button press in m_mat.
function m_mat_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile();

if isequal([FileName,PathName],[0,0])
    handles.M=0;
    return
else
    File = fullfile(PathName,FileName);
    handles.M=importdata(File);
end
handles.M=matrixeditor(handles.M);
guidata(hObject,handles);

% --- Executes on button press in c_mat.
function c_mat_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile();
if isequal([FileName,PathName],[0,0])
    return
else
    File = fullfile(PathName,FileName);
    handles.C=importdata(File);
end
handles.C=matrixeditor(handles.C);
guidata(hObject,handles);

% --- Executes on button press in h_mat.
function h_mat_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile();
if isequal([FileName,PathName],[0,0])
    return
else
    File = fullfile(PathName,FileName);
    handles.H=importdata(File);
end
handles.H=matrixeditor(handles.H);
guidata(hObject,handles);

% --- Executes on button press in f_mat.
function f_mat_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile();

if isequal([FileName,PathName],[0,0])
    return
else
    File = fullfile(PathName,FileName);
    handles.F=importdata(File);
end
guidata(hObject,handles);

% % --- Executes on selection change in popupmenu1.
% function popupmenu1_Callback(hObject, eventdata, handles)
% contents=cellstr(get(hObject,'string'));
% exc_type=contents(get(hObject,'value'));
% if (strcmp(exc_type,'sinwt'))
%     e_type=1;
% elseif (strcmp(exc_type,'coswt'))
%     e_type=2;
% elseif (strcmp(exc_type,'e^iwt'))
%     e_type=3;
% end
% guidata(hObject,handles);
% 
% % --- Executes during object creation, after setting all properties.
% function popupmenu1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to popupmenu1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: popupmenu controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% guidata(hObject,handles);


function nlelement_Callback(hObject, eventdata, handles)
% hObject    handle to nlelement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nlelement as text
%        str2double(get(hObject,'String')) returns contents of nlelement as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function nlelement_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nlelement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);

function nodei_Callback(hObject, eventdata, handles)
% hObject    handle to nodei (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodei as text
%        str2double(get(hObject,'String')) returns contents of nodei as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function nodei_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodei (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);

function nodej_Callback(hObject, eventdata, handles)
% hObject    handle to nodej (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodej as text
%        str2double(get(hObject,'String')) returns contents of nodej as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function nodej_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodej (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);


function C1_Callback(hObject, eventdata, handles)
% hObject    handle to TEXT6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TEXT6 as text
%        str2double(get(hObject,'String')) returns contents of TEXT6 as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function C1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TEXT6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);


function C2_Callback(hObject, eventdata, handles)
% hObject    handle to C2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C2 as text
%        str2double(get(hObject,'String')) returns contents of C2 as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function C2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);


function C3_Callback(hObject, eventdata, handles)
% hObject    handle to TEXT8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TEXT8 as text
%        str2double(get(hObject,'String')) returns contents of TEXT8 as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function C3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TEXT8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);


% --- Executes when entered data in editable cell(s) in uitable2.
function uitable2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
guidata(hObject,handles);


function w_start_Callback(hObject, eventdata, handles)
% hObject    handle to w_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w_start as text
%        str2double(get(hObject,'String')) returns contents of w_start as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function w_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);


function w_end_Callback(hObject, eventdata, handles)
% hObject    handle to w_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w_end as text
%        str2double(get(hObject,'String')) returns contents of w_end as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function w_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);


function ds_Callback(hObject, eventdata, handles)
% hObject    handle to ds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ds as text
%        str2double(get(hObject,'String')) returns contents of ds as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ds_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);


function error_Callback(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of error as text
%        str2double(get(hObject,'String')) returns contents of error as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);

function numite_Callback(hObject, eventdata, handles)
% hObject    handle to numite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numite as text
%        str2double(get(hObject,'String')) returns contents of numite as a double


% --- Executes during object creation, after setting all properties.
function numite_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function N_opt_Callback(hObject, eventdata, handles)
% hObject    handle to N_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N_opt as text
%        str2double(get(hObject,'String')) returns contents of N_opt as a double


% --- Executes during object creation, after setting all properties.
function N_opt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function force_Callback(hObject, eventdata, handles)
% hObject    handle to force (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of force as text
%        str2double(get(hObject,'String')) returns contents of force as a double


% --- Executes during object creation, after setting all properties.
function force_CreateFcn(hObject, eventdata, handles)
% hObject    handle to force (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fnode_Callback(hObject, eventdata, handles)
% hObject    handle to fnode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fnode as text
%        str2double(get(hObject,'String')) returns contents of fnode as a double


% --- Executes during object creation, after setting all properties.
function fnode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fnode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exctype_Callback(hObject, eventdata, handles)
% hObject    handle to exctype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exctype as text
%        str2double(get(hObject,'String')) returns contents of exctype as a double


% --- Executes during object creation, after setting all properties.
function exctype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exctype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function responsemass_Callback(hObject, eventdata, handles)
% hObject    handle to text35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text35 as text
%        str2double(get(hObject,'String')) returns contents of text35 as a double


% --- Executes during object creation, after setting all properties.
function text35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function responseforce_Callback(hObject, eventdata, handles)
% hObject    handle to responseforce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of responseforce as text
%        str2double(get(hObject,'String')) returns contents of responseforce as a double


% --- Executes during object creation, after setting all properties.
function responseforce_CreateFcn(hObject, eventdata, handles)
% hObject    handle to responseforce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nfcalculator.
function nfcalculator_Callback(hObject, eventdata, handles)
wn=nfcalculator(handles.K, handles.M, handles.H);
wn = num2cell(wn);
set(handles.uitable1, 'Visible', 'on');
set(handles.uitable1, 'Data', wn);
set(handles.nlbutton,'Visible', 'on');
set(handles.remove,'Visible', 'on');
set(handles.solver,'Visible', 'on');
set(handles.nlelement,'Visible', 'on');
set(handles.nodei,'Visible', 'on');
set(handles.nodej,'Visible', 'on');
set(handles.C1,'Visible', 'on');
set(handles.C2,'Visible', 'on');
set(handles.C3,'Visible', 'on');
set(handles.w_start,'Visible', 'on');
set(handles.w_end,'Visible', 'on');
set(handles.ds,'Visible', 'on');
set(handles.error,'Visible', 'on');
set(handles.numite,'Visible', 'on');
set(handles.N_opt,'Visible', 'on');
set(handles.text3,'Visible', 'on');
set(handles.text4,'Visible', 'on');
set(handles.text5,'Visible', 'on');
set(handles.text6,'Visible', 'on');
set(handles.text7,'Visible', 'on');
set(handles.text8,'Visible', 'on');
set(handles.text12,'Visible', 'on');
set(handles.text13,'Visible', 'on');
set(handles.text14,'Visible', 'on');
set(handles.text15,'Visible', 'on');
set(handles.text16,'Visible', 'on');
set(handles.text17,'Visible', 'on');
set(handles.text18,'Visible', 'on');
set(handles.axes1,'Visible', 'on');
set(handles.uitable2, 'Visible', 'on');
 I = imread('image1.png');
 axes(handles.axes1);
 imshow(I);
guidata(hObject,handles);

% --- Executes on button press in nlbutton.
function nlbutton_Callback(hObject, eventdata, handles)
global p
NLelement=get(handles.nlelement, 'string');
Nodei=get(handles.nodei, 'string');
Nodej=get(handles.nodej, 'string');
C1=get(handles.C1, 'string');
C2=get(handles.C2, 'string');
C3=get(handles.C3, 'string');
p.NLdata=[p.NLdata;[ {NLelement} {Nodei} {Nodej} {C1} {C2} {C3} ]];
set(handles.uitable2,'Data',p.NLdata)
guidata(hObject,handles);

% --- Executes on button press in forcebutton.
function forcebutton_Callback(hObject, eventdata, handles)
% hObject    handle to forcebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with hand
global p
Force=get(handles.force, 'string');
fNode=get(handles.fnode, 'string');
e_type=get(handles.exctype, 'string');
p.Fdata=[p.Fdata;[ {Force} {fNode} {e_type} ]];
set(handles.uitable4,'Data',p.Fdata)
guidata(hObject,handles);

% --- Executes on button press in solver.
function solver_Callback(hObject, eventdata, handles)
global p
w_min=get(handles.w_start, 'string');
w_min=str2double(w_min);
w_max=get(handles.w_end, 'string');
w_max=str2double(w_max);
ds=get(handles.ds, 'string');
ds=str2double(ds);
error=get(handles.error, 'string');
error=str2double(error);
numite=get(handles.numite, 'string');
numite=str2double(numite);
N_opt=get(handles.N_opt, 'string');
N_opt=str2double(N_opt);
nl_data=str2double(p.NLdata);
f_data=str2double(p.Fdata);
[solution,w_plot,n]=alsolver(nl_data,w_min,w_max,ds,error,numite,N_opt,handles.M,handles.K,handles.C,handles.H,f_data);
handles.solution=solution;
handles.w_plot=w_plot;
handles.n=n;
set(handles.axes2,'Visible', 'on');
set(handles.plot,'Visible', 'on');
set(handles.export,'Visible', 'on');
set(handles.exportf,'Visible', 'on');
set(handles.responsemass,'Visible', 'on');
set(handles.responseforce,'Visible', 'on');
set(handles.text35,'Visible', 'on');
set(handles.text25,'Visible', 'on');
set(handles.text26,'Visible', 'on');
set(handles.text27,'Visible', 'on');
set(handles.plot_type,'Visible', 'on');
guidata(hObject,handles);


% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Plotting
global p
 if isfield(handles,'solution')
     solution=handles.solution;
 end
 if isfield(handles,'w_plot')
     w_plot=handles.w_plot;
 end 
  if isfield(handles,'n')
     n=handles.n;
 end 
m1=get(handles.responsemass, 'string');
m1=str2double(m1);
f1=get(handles.responseforce, 'string');
f1=str2double(f1);
plot_type=get(handles.plot_type, 'string');
plot_type=str2double(plot_type);
f_data=str2double(p.Fdata);
f_response=f_data(f1,1);
axes(handles.axes2);
if plot_type==1
plot(w_plot(:,1),sqrt(solution(:,m1).^2+solution(:,n+m1).^2)/f_response);
elseif plot_type==2
semilogy(w_plot(:,1),sqrt(solution(:,m1).^2+solution(:,n+m1).^2)/f_response);
elseif plot_type==3
loglog(w_plot(:,1),sqrt(solution(:,m1).^2+solution(:,n+m1).^2)/f_response);  
end
hold on
title('Normalized Response of Mass vs Frequency');
xlabel('w(rad/s)');
ylabel('X/F');  
    

% --- Executes on button press in remove.
function remove_Callback(hObject, eventdata, handles)
global p
% hObject    handle to remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable2,'Data',[])
p.NLdata=[];

% --- Executes on button press in export.
function export_Callback(hObject, eventdata, handles)
% hObject    handle to export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of export
 if isfield(handles,'solution')
     solution=handles.solution;
 end
dlmwrite('responseresults.txt', solution, 'delimiter','\t','newline','pc');

        
 function exportf_Callback(hObject, eventdata, handles)
% hObject    handle to export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of export
 if isfield(handles,'w_plot')
     w_plot=handles.w_plot;
 end
    
dlmwrite('frequencyresults.txt', w_plot, 'delimiter','\t','newline','pc');

        

function plot_type_Callback(hObject, eventdata, handles)
% hObject    handle to plot_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of plot_type as text
%        str2double(get(hObject,'String')) returns contents of plot_type as a double


% --- Executes during object creation, after setting all properties.
function plot_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
