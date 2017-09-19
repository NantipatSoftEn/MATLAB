function varargout = test1(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test1_OpeningFcn, ...
                   'gui_OutputFcn',  @test1_OutputFcn, ...
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

% hObject   �Ѵ��� Object
% eventdata  
% handles    �Ѵ����ç���ҧ
% varargin   �ҡ����鹷���Ѻ��


% --- Executes just before test1 is made visible.
function test1_OpeningFcn(hObject, eventdata, handles, varargin)


handles.peaks = peaks(35);

handles.membrane = membrane;

[x,y] = meshgrid(-8:0.5:8);

r = sqrt(x.^2+y.^2)+ eps;

sinc = sin(r)./r;

handles.sinc = sinc;


handles.current_data = handles.peaks;

surf(handles.current_data);

% Choose default command line output for test1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = test1_OutputFcn(hObject, eventdata, handles) 


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

val = get(hObject,'value');

switch val
    case 1
           handles.current_data =  handles.peaks;
    case 2
           handles.current_data =  handles.membrane;
    case 3
            handles.current_data =  handles.sinc;
  
end
 guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)


% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in surf_pushbutton.
function surf_pushbutton_Callback(hObject, eventdata, handles)

surf(handles.current_data);

% --- Executes on button press in Mesh.++*+
function Mesh_Callback(hObject, eventdata, handles)


mesh(handles.current_data);

% --- Executes on button press in contour_pushbutton.
function contour_pushbutton_Callback(hObject, eventdata, handles)


contour(handles.current_data);


% --- Executes on button press in surfl_pushbutton.
function surfl_pushbutton_Callback(hObject, eventdata, handles)


