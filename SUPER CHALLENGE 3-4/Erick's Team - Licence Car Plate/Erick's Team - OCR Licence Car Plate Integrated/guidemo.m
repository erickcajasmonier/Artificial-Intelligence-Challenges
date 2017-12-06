 function varargout = guidemo(varargin)

% Start initialization code
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guidemo_OpeningFcn, ...
                   'gui_OutputFcn',  @guidemo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code


% --- Executes just before guidemo is made visible.
function guidemo_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

a=ones(256,256);
axes(handles.axes1);
imshow(a);


a=ones(50,150);
axes(handles.axes2);
imshow(a);

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = guidemo_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)

[filename, pathname] = uigetfile('*.jpg', 'Pick an Image');
    if isequal(filename,0) | isequal(pathname,0)
       warndlg('User pressed cancel')
    else
		a=imread(filename);
		axes(handles.axes1);
		imshow(a);
                
		handles.a=a;
        % Update handles structure
guidata(hObject, handles);
        
    end

    
% --- Executes on button press in Segment.
function Segment_Callback(hObject, eventdata, handles)

a=handles.a;

a=rgb2gray(a);


[r c p]=size(a);
b=a(r/3:r,1:c);

 imshow(b);title('LP AREA')
 
[r c p]=size(b);
Out=zeros(r,c);
for i=1:r
    for j=1:c

        if b(i,j)>150
            Out(i,j)=1;
        else
            Out(i,j)=0;
        end
    end
end
imshow(Out,[]);

% load Out;
BW3 = bwfill(Out,'holes');

BW3=medfilt2(BW3,[3 3]);
BW3=medfilt2(BW3,[3 3]);
BW3=medfilt2(BW3,[3 3]);
BW3=medfilt2(BW3,[5 5]);
BW3=medfilt2(BW3,[5 5]);

imshow(BW3,[]);

BW3 = bwfill(BW3,'holes');
[L num]=bwlabel(BW3);

STATS=regionprops(L,'all');


disp(num);

cc=[];
removed=0;
for i=1:num
dd=STATS(i).Area;
cc(i)=dd;

	if (dd < 50000)
          	L(L==i)=0;
			removed = removed + 1;
            num=num-1;
    else
        
    end
    
    
end


[L2 num2]=bwlabel(L);

imshow(L2);
 STATS = regionprops(L2,'All');

if num2>2
     for i=1:num2
         
	aa=  STATS(i).Orientation;    
	if aa > 0
        
	imshow(L==i);    
	end
     end
	disp('exit');
end

 [r c]=size(L2);
Out=zeros(r,c);
k=1;


 B=STATS.BoundingBox;

Xmin=B(2);
Xmax=B(2)+B(4);

Ymin=B(1)
Ymax=B(1)+B(3);

LP=[];
LP=b(Xmin+25:Xmax-20,Ymin+10:Ymax-10);

axes(handles.axes2);
imshow(LP);

handles.LP=LP;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in Recognition.
function Recognition_Callback(hObject, eventdata, handles)

LP=handles.LP;
aa=LP;

I=split(aa);
disp(I);
Len=length(I);

LEN=length(I);
load DataBase;

RECOG=[];

Dlen=540
k=1;
for i=1:LEN
    
    Test=I{i};    

    for j=1:Dlen
    

		Test2=DataBase{j};

		X(j)=corr2(Test,Test2);
    end
    [Res INDEX]=max(X);
    RECOG(k)=INDEX;
    k=k+1;
		disp(INDEX);
    
end
disp('Exit');

Len=length(RECOG);
Output=[]
for i=1:Len
    
a=    RECOG(i);
		
	if (a>=1)&(a<=15)
		Output=[Output '0']
        
    elseif (a>=16)&(a<=30)
		Output=[Output '1']
        
    elseif (a>=31)&(a<=45)
		Output=[Output '2']
        
    elseif (a>=46)&(a<=60)
            Output=[Output '3']
            
    elseif (a>=61)&(a<=75)
		Output=[Output '4']
        
    elseif (a>=76)&(a<=90)
		Output=[Output '5']
        
    elseif  (a>=91)&(a<=105)
		Output=[Output '6']
        
    elseif  (a>=106)&(a<=120)
		Output=[Output '7']
		
	elseif (a>=121)&(a<=135)
		Output=[Output '8']
        
    elseif  (a>=136)&(a<=150)
		Output=[Output '9']
        
    elseif  (a>=151)&(a<=165)
		Output=[Output 'A']
		
	elseif  (a>=166)&(a<=180)
		Output=[Output 'B']
        
    elseif  (a>=181)&(a<=195) 
		Output=[Output 'C']
		
	elseif  (a>=196)&(a<=210)
		Output=[Output 'D']
        
	elseif  (a>=211)&(a<=225)
		Output=[Output 'E']
        
    elseif  (a>=226)&(a<=240)
		Output=[Output 'F']
        
    elseif  (a>=241)&(a<=255)
		Output=[Output 'G'] 
        
    elseif  (a>=256)&(a<=270)
		Output=[Output 'H'] 
        
    elseif  (a>=271)&(a<=285)
		Output=[Output 'I'] 
        
    elseif  (a>=286)&(a<=300)
		Output=[Output 'J'] 
        
    elseif  (a>=301)&(a<=315)
		Output=[Output 'K'] 
        
    elseif  (a>=316)&(a<=330)
		Output=[Output 'L'] 
        
    elseif  (a>=331)&(a<=345)
		Output=[Output 'M']
        
    elseif  (a>=346)&(a<=360)
		Output=[Output 'N']
        
    elseif  (a>=361)&(a<=375)
		Output=[Output 'O'] 
        
    elseif  (a>=376)&(a<=390)
		Output=[Output 'P'] 
        
    elseif  (a>=391)&(a<=405)
		Output=[Output 'Q'] 
        
    elseif  (a>=406)&(a<=420)
		Output=[Output 'R'] 
        
    elseif  (a>=421)&(a<=435)
		Output=[Output 'S'] 
        
    elseif  (a>=436)&(a<=450)
		Output=[Output 'T'] 
        
    elseif  (a>=451)&(a<=465)
		Output=[Output 'U'] 
        
    elseif  (a>=466)&(a<=480)
		Output=[Output 'V'] 
        
    elseif  (a>=481)&(a<=495)
		Output=[Output 'W'] 
        
    elseif  (a>=496)&(a<=510)
		Output=[Output 'X'] 
        
    elseif  (a>=511)&(a<=525)
		Output=[Output 'Y'] 
        
    elseif  (a>=526)&(a<=540)
		Output=[Output 'Z']
    end

end
   
disp('NUMBER PLATE');
disp(Output);
Output=num2str(Output);
set(handles.lp,'String',Output);
if (exist('output.txt'))

   delete output.txt;
end
B=num2str(Output);

fid = fopen('output.txt', 'a');
 fprintf(fid,'%s\r',B);
        fclose(fid);
    save Output Output;


% --- Executes during object creation, after setting all properties.
function lp_CreateFcn(hObject, eventdata, handles)

if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

DataBase=[];
str='.bmp';
k=1;
for i=1:15
    filename=strcat(num2str(i),str);
    cd '0'
    a=imread(filename);
     C=Train(a);

figure;
 imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
   cd ..
    
end
close all;
for i=1:15
    filename=strcat(num2str(i),str);
    cd '1'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end

for i=1:15
    filename=strcat(num2str(i),str);
    cd '2'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end


for i=1:15
    filename=strcat(num2str(i),str);
    cd '3'
    a=imread(filename);
      imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
cd ..
    
end


for i=1:15
    filename=strcat(num2str(i),str);
    cd '4'
    a=imread(filename);
      imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
 cd ..
    
end


for i=1:15
    filename=strcat(num2str(i),str);
    cd '5'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
   cd ..
    
end


for i=1:15
    filename=strcat(num2str(i),str);
    cd '6'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
cd ..
    
end

for i=1:15
    filename=strcat(num2str(i),str);
    cd '7'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
cd ..
    
end

for i=1:15
    filename=strcat(num2str(i),str);
    cd '8'
    a=imread(filename);
      imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
   cd ..
    
end

for i=1:15
    filename=strcat(num2str(i),str);
    cd '9'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
cd ..
    
end

for i=1:15
    filename=strcat(num2str(i),str);
    cd 'A'
    a=imread(filename);
   imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
cd ..
    
end

for i=1:15
    filename=strcat(num2str(i),str);
    cd 'B'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
   cd ..
    
end


for i=1:15
    filename=strcat(num2str(i),str);
    cd 'C'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
  cd ..
    
end

for i=1:15
    filename=strcat(num2str(i),str);
    cd 'D'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end

for i=1:15
    filename=strcat(num2str(i),str);
    cd 'E'
    a=imread(filename);
   imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'F'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'G'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'H'
    a=imread(filename);
   imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'I'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'J'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'K'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'L'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'M'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'N'
    a=imread(filename);
   imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'O'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'P'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'Q'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'R'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'S'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'T'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'U'
    a=imread(filename);
     imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'V'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'W'
    a=imread(filename);
  imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'X'
    a=imread(filename);
   imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'Y'
    a=imread(filename);
     C=Train(a);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end
for i=1:15
    filename=strcat(num2str(i),str);
    cd 'Z'
    a=imread(filename);
    imshow(a);
     C=Train(a);
     figure;
     imshow(C,[]);
    DataBase{k}=C;
    k=k+1;
    cd ..
    
end

save DataBase DataBase
guidemo;
msgbox('Datbase Created Succesfully');
