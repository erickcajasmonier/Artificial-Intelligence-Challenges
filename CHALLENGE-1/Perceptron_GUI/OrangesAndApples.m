function varargout = OrangesAndApples(varargin)
% ORANGESANDAPPLES MATLAB code for OrangesAndApples.fig
%      ORANGESANDAPPLES, by itself, creates a new ORANGESANDAPPLES or raises the existing
%      singleton*.
%
%      H = ORANGESANDAPPLES returns the handle to a new ORANGESANDAPPLES or the handle to
%      the existing singleton*.
%
%      ORANGESANDAPPLES('ORANGESANDAPPLES',hObject,eventData,handles,...) calls the local
%      function named ORANGESANDAPPLES in ORANGESANDAPPLES.M with the given input arguments.
%
%      ORANGESANDAPPLES('Property','Value',...) creates a new ORANGESANDAPPLES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OrangesAndApples_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OrangesAndApples_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OrangesAndApples

% Last Modified by GUIDE v2.5 06-Sep-2017 18:31:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OrangesAndApples_OpeningFcn, ...
                   'gui_OutputFcn',  @OrangesAndApples_OutputFcn, ...
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


% --- Executes just before OrangesAndApples is made visible.
function OrangesAndApples_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OrangesAndApples (see VARARGIN)

% Choose default command line output for OrangesAndApples
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OrangesAndApples wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OrangesAndApples_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in rough.
function rough_Callback(hObject, eventdata, handles)
% hObject    handle to rough (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rough


function smooth_Callback(hObject, eventdata, handles)



function elliptical_Callback(hObject, eventdata, handles)


% --- Executes on button press in simulate.
function simulate_Callback(hObject, eventdata, handles)
o = get (handles.rough, 'Value')
o1 = get (handles.elliptical, 'Value')
o2 = get (handles.more1lib, 'Value')
a = get(handles.smooth,'Value')
a1 = get(handles.pound,'Value')
a2 = get(handles.minus1lib,'Value')
if(a==1 && a1==1 && a2==1 || o1==1 && a==1 && a2==1)
    set(handles.text1,'String','Apple')
    
else if (a2==1 && o==1 && a1==1 || a2==1 && o==1 && o1==1)
    set(handles.text1,'String','Orange')
    
    end
    
end

% hObject    handle to simulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in list.
function list_Callback(hObject, eventdata, handles)
% hObject    handle to list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list


% --- Executes during object creation, after setting all properties.
function list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
