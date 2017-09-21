function varargout = BMI(varargin)
% BMI MATLAB code for BMI.fig
%      BMI, by itself, creates a new BMI or raises the existing
%      singleton*.
%
%      H = BMI returns the handle to a new BMI or the handle to
%      the existing singleton*.
%
%      BMI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BMI.M with the given input arguments.
%
%      BMI('Property','Value',...) creates a new BMI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BMI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BMI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BMI

% Last Modified by GUIDE v2.5 20-Sep-2017 06:07:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BMI_OpeningFcn, ...
                   'gui_OutputFcn',  @BMI_OutputFcn, ...
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


% --- Executes just before BMI is made visible.
function BMI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BMI (see VARARGIN)

% Choose default command line output for BMI
handles.output = hObject;
axes(handles.axes1);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BMI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BMI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function feet_Callback(hObject, eventdata, handles)
% hObject    handle to feet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of feet as text
%        str2double(get(hObject,'String')) returns contents of feet as a double


% --- Executes during object creation, after setting all properties.
function feet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to feet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inches_Callback(hObject, eventdata, handles)
% hObject    handle to inches (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inches as text
%        str2double(get(hObject,'String')) returns contents of inches as a double


% --- Executes during object creation, after setting all properties.
function inches_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inches (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function punds_Callback(hObject, eventdata, handles)
% hObject    handle to punds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of punds as text
%        str2double(get(hObject,'String')) returns contents of punds as a double


% --- Executes during object creation, after setting all properties.
function punds_CreateFcn(hObject, eventdata, handles)
% hObject    handle to punds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function BMI_Callback(hObject, eventdata, handles)
% hObject    handle to BMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BMI as text
%        str2double(get(hObject,'String')) returns contents of BMI as a double
a = str2num(get(handles.feet,'string'));
b = str2num(get(handles.inches,'string'));
c = str2num(get(handles.pound,'string'));
a2 = a*12;
mass = 703*((c/(a2+b)^2));
bmi = num2str(mass);
set(handles.BMI,'string',bmi);

% --- Executes during object creation, after setting all properties.
function BMI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
