function varargout = GUIPlotPolarization(varargin)
% GUIPLOTPOLARIZATION M-file for GUIPlotPolarization.fig
%      GUIPLOTPOLARIZATION, by itself, creates a new GUIPLOTPOLARIZATION or raises the existing
%      singleton*.
%
%      H = GUIPLOTPOLARIZATION returns the handle to a new GUIPLOTPOLARIZATION or the handle to
%      the existing singleton*.
%
%      GUIPLOTPOLARIZATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIPLOTPOLARIZATION.M with the given input arguments.
%
%      GUIPLOTPOLARIZATION('Property','Value',...) creates a new GUIPLOTPOLARIZATION or raises the
%      existing singleton*.  Starting from the left, property value pairs
%      are
%      applied to the GUI before GUIPlotPolarization_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIPlotPolarization_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIPlotPolarization

% Last Modified by GUIDE v2.5 13-Apr-2012 00:51:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIPlotPolarization_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIPlotPolarization_OutputFcn, ...
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
 
function varargout = GUIPlotPolarization_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

varargout{1} = handles.output;

% --- Executes just before GUIPlotPolarization is made visible.
function GUIPlotPolarization_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIPlotPolarization (see VARARGIN)
clc;

% Choose default command line output for GUIPlotPolarization
handles.output = hObject;
% Update handles structure

handles.movedLast = 1;

for i = 1:10
    eval( ['handles.var' num2str(i) ' = 0;'] ); 
end

% 
% for i = 7:10
%     eval( [ 'set(handles.var' num2str(i) 'Edit,''Visible'',''off''); ']);
%     eval( [ 'set(handles.variable' num2str(i) 'StaticText,''Visible'',''off''); ']);
% end
for i = 7:7
    eval( [ 'set(handles.var' num2str(i) 'Slider,''Visible'',''off''); ']);
end


% check if defaultSliderRanges.dat exist, if not create it
[path1, name1, ext1] = fileparts(which(mfilename));
fid = fopen(fullfile(path1,'defaultSliderRanges.dat'));
if fid == -1
    % columns:
    % 1) initial value
    % 2) mininum
    % 3) maximum
    % 4) step
    csvwrite('defaultSliderRanges.dat', repmat([0 0 1 0.05],[10, 1]));
end

% load slider ranges from the dat file 
load defaultSliderRanges.dat
for i = 1:10
    eval( [ 'handles.var' num2str(i) ' = defaultSliderRanges(' num2str(i) ',1);' ] );
end
handles.defaultSliderRanges = defaultSliderRanges;

% handles.var1 = 0;
% handles.var2 = 0;
% handles.var3 = 0;
% handles.var4 = 0;
% handles.var5 = 0;
% handles.var6 = 0;
% handles.var7 = 0;
% handles.var8 = 0;
% handles.var9 = 0;
% handles.var10 = 0;

% UIWAIT makes GUIPlotPolarization wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1, 'Name', 'Polarization ellipse and Poincare sphere');

guidata(hObject, handles);

Update(handles);

% --------------------------------------------------------------------
function ChangeSliderRange_Callback(hObject, eventdata, handles)

prompt = {'Enter the number of a slider:', ...
          'Enter the MIN value for a slider:', ...
          'Enter the MAX value for a slider:', ...
          'Enter the STEP value for a slider [0 to 1]:'};
name = 'Change slider range';
numlines = 1;
defaultAnswer = {'1','0','1', '0.2' };
answer = inputdlg(prompt, name, numlines, defaultAnswer);

if (numel(answer) ~= 0)
    if eval(['handles.var' answer{1}]) < str2num(answer{2})
        eval(['handles.var' answer{1} ' = str2num(answer{2});']);
    end
    if eval(['handles.var' answer{1}]) > str2num(answer{3})
        eval(['handles.var' answer{1} ' = str2num(answer{3});']);
    end
        
    handles.defaultSliderRanges(str2num(answer{1}),1) = eval(['handles.var' answer{1}]);
    handles.defaultSliderRanges(str2num(answer{1}),2) = str2num(answer{2});
    handles.defaultSliderRanges(str2num(answer{1}),3) = str2num(answer{3});
    handles.defaultSliderRanges(str2num(answer{1}),4) = str2num(answer{4});
    for i = 1:10
        handles.defaultSliderRanges(i,4) = str2num(answer{4});
    end
end
guidata(hObject, handles);
UpdateSlidersAndBoxes(handles);
% csvwrite('defaultSliderRanges.dat', handles.defaultSliderRanges);

function var1Slider_Callback(hObject, eventdata, handles)
handles.var1 = get(hObject,'Value');
handles.movedLast = 1;
guidata(hObject, handles);
Update(handles)
function var2Slider_Callback(hObject, eventdata, handles)
handles.var2 = get(hObject,'Value');
handles.movedLast = 2;
guidata(hObject, handles);
Update(handles)
function var3Slider_Callback(hObject, eventdata, handles)
handles.var3 = get(hObject,'Value');
handles.movedLast = 3;
guidata(hObject, handles);
Update(handles)
function var4Slider_Callback(hObject, eventdata, handles)
handles.var4 = get(hObject,'Value');
handles.movedLast = 4;
guidata(hObject, handles);
Update(handles)
function var5Slider_Callback(hObject, eventdata, handles)
handles.var5 = get(hObject,'Value');
handles.movedLast = 5;
guidata(hObject, handles);
Update(handles)
function var6Slider_Callback(hObject, eventdata, handles)
handles.var6 = get(hObject,'Value');
handles.movedLast = 6;
guidata(hObject, handles);
Update(handles)
function var7Slider_Callback(hObject, eventdata, handles)
handles.var7 = get(hObject,'Value');
handles.movedLast = 7;
guidata(hObject, handles);
Update(handles)
function var8Slider_Callback(hObject, eventdata, handles)
handles.var8 = get(hObject,'Value');
handles.movedLast = 8;
guidata(hObject, handles);
Update(handles)
function var9Slider_Callback(hObject, eventdata, handles)
handles.var9 = get(hObject,'Value');
handles.movedLast = 9;
guidata(hObject, handles);
Update(handles)
function var10Slider_Callback(hObject, eventdata, handles)
handles.var10 = get(hObject,'Value');
handles.movedLast = 10;
guidata(hObject, handles);
Update(handles)

function var1Edit_Callback(hObject, eventdata, handles)
handles.var1 = str2num(get(hObject,'String'));
handles.movedLast = 1;
guidata(hObject, handles);
Update(handles)
function var2Edit_Callback(hObject, eventdata, handles)
handles.var2 = str2num(get(hObject,'String'));
handles.movedLast = 2;
guidata(hObject, handles);
Update(handles)
function var3Edit_Callback(hObject, eventdata, handles)
handles.var3 = str2num(get(hObject,'String'));
handles.movedLast = 3;
guidata(hObject, handles);
Update(handles)
function var4Edit_Callback(hObject, eventdata, handles)
handles.var4 = str2num(get(hObject,'String'));
handles.movedLast = 4;
guidata(hObject, handles);
Update(handles)
function var5Edit_Callback(hObject, eventdata, handles)
handles.var5 = str2num(get(hObject,'String'));
handles.movedLast = 5;
guidata(hObject, handles);
Update(handles)
function var6Edit_Callback(hObject, eventdata, handles)
handles.var6 = str2num(get(hObject,'String'));
handles.movedLast = 6;
guidata(hObject, handles);
Update(handles)
function var7Edit_Callback(hObject, eventdata, handles)
handles.var7 = str2num(get(hObject,'String'));
handles.movedLast = 7;
guidata(hObject, handles);
Update(handles)
function var8Edit_Callback(hObject, eventdata, handles)
handles.var8 = str2num(get(hObject,'String'));
handles.movedLast = 8;
guidata(hObject, handles);
Update(handles)
function var9Edit_Callback(hObject, eventdata, handles)
handles.var9 = str2num(get(hObject,'String'));
handles.movedLast = 9;
guidata(hObject, handles);
Update(handles)
function var10Edit_Callback(hObject, eventdata, handles)
handles.var10 = str2num(get(hObject,'String'));
handles.movedLast = 10;
guidata(hObject, handles);
Update(handles)

function UpdateSlidersAndBoxes(handles)
for i = 1:10
    eval([ ' set(handles.var' num2str(i) 'Edit,''String'',num2str(handles.var' num2str(i) '''));' ]);
    eval([ ' set(handles.var' num2str(i) 'Slider,''Value'', handles.var' num2str(i) '); ' ]);
    eval([ ' set(handles.var' num2str(i) 'Slider,''Min'', handles.defaultSliderRanges(i,2)) '] );
    eval([ ' set(handles.var' num2str(i) 'Slider,''Max'', handles.defaultSliderRanges(i,3)) '] );
    eval([ ' set(handles.var' num2str(i) 'Slider,''SliderStep'', [handles.defaultSliderRanges(i,4), 0.1]); ']);
    handles.defaultSliderRanges(i,1) = eval(['handles.var' num2str(i)]);
end
csvwrite('defaultSliderRanges.dat', handles.defaultSliderRanges);

function Update(handles)
UpdateSlidersAndBoxes(handles);

%%% begin your code
% function [x,y, theta] = PlotEllipse(xc, yc, ax, phix, ay, phiy, sampling)
% xc and yc are center coordinates
%
if sum(handles.movedLast == [1 2 3 4]) % jones vectors
    ax = handles.var1;
    phix = handles.var2;
    ay = handles.var3;
    phiy = handles.var4;
    
    sampling = 360;  % sampling is the number of points used to plot ellipse
    scale = 1;
    xc = 10;
    yc = 10;
    
    axes(handles.axes1);
    cla;
    [psi, chi, S] = PlotEllipseUsingJonesVectors(xc, yc, ax, phix, ay, phiy, sampling, scale);
    axis([0 20 0 20]);
    set(handles.var5Edit,'String',num2str(psi));
    set(handles.var6Edit,'String',num2str(chi));
    title('Polarization ellipse')
    
    %% 3D plot
    axes(handles.axes2);
    % phiNew(:,1:N/2) = phiNew(:,1:N/2) + 180;
    % phiNew(1:N/2,:) = phiNew(1:N/2,:) + 180;
    SphereTemplate;
    AddPolarimetryData(S');
    
    set(handles.var7Edit,'String',num2str(S(1)));
    set(handles.var8Edit,'String',num2str(S(2)));
    set(handles.var9Edit,'String',num2str(S(3)));
    set(handles.var10Edit,'String',num2str(S(4)));
end

if sum(handles.movedLast == [5 6])  %polarization ellipse parameters
    psi = handles.var5;
    chi = handles.var6;
    xc = 10;
    yc = 10;
    scale = 5;
    sampling = 360;
    axes(handles.axes1);
    cla;
    axis([0 20 0 20]);
    S = PlotEllipseUsingEllipseParameters(xc, yc, psi, chi, sampling, scale);
    title('Polarization ellipse')
    
    axes(handles.axes2);
    SphereTemplate;
    AddPolarimetryData(S');
        
    set(handles.var7Edit,'String',num2str(S(1)));
    set(handles.var8Edit,'String',num2str(S(2)));
    set(handles.var9Edit,'String',num2str(S(3)));
    set(handles.var10Edit,'String',num2str(S(4)));
end

if sum(handles.movedLast == [8 9 10])  % stokes parameters
    
    S1 = handles.var8;
    S2 = handles.var9;
    S3 = handles.var10;
    S0 = sqrt(S1^2 + S2^2 + S3^2);
    S = [S0 S1 S2 S3];
    axes(handles.axes2);
    SphereTemplate;
    AddPolarimetryData(S');
    
    xc = 10;
    yc = 10;
    scale = S0;
    sampling = 360;
    
    axes(handles.axes1);
    cla;
    [psi, chi] = PlotEllipseUsingStokesParameters(xc, yc, S, sampling);
    axis([0 20 0 20]);
    set(handles.var5Edit,'String',num2str(psi));
    set(handles.var6Edit,'String',num2str(chi));
    title('Polarization ellipse')
    
end


% --- Executes on button press in PScla.
function PScla_Callback(hObject, eventdata, handles)
% hObject    handle to PScla (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
cla;
