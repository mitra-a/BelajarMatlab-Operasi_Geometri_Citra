function varargout = LatihanGUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LatihanGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LatihanGUI_OutputFcn, ...
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


% --- Executes just before LatihanGUI is made visible.
function LatihanGUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

global a;
global b;

gambar1 = imread('gambar1.jpg');
gambar2 = imread('gambar2.jpg');

a = rgb2gray(gambar1);
b = rgb2gray(gambar2);

axes(handles.firstImage);
imshow(a);

axes(handles.secondImage);
imshow(b);

% --- Outputs from this function are returned to the command line.
function varargout = LatihanGUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- INI FUNGSI TOMBOL PENJUMLAHAN.
function pushbutton1_Callback(hObject, eventdata, handles)
global a;
global b;
axes(handles.firstImage);
imshow(a);
axes(handles.secondImage);
imshow(b);

axes(handles.resultImage);
imshow(a + 200);


% --- INI FUNGSI TOMBOL PENGURANGAN.
function pushbutton2_Callback(hObject, eventdata, handles)
global a;
global b;
axes(handles.firstImage);
imshow(a);
axes(handles.secondImage);
imshow(b);

axes(handles.resultImage);
imshow(a - 30);


% --- INI FUNGSI TOMBOL PERKALIAN.
function pushbutton3_Callback(hObject, eventdata, handles)
global a;
global b;
axes(handles.firstImage);
imshow(a);
axes(handles.secondImage);
imshow(b);

axes(handles.resultImage);
imshow(a * 0.5);


% --- INI FUNGSI TOMBOL PEMBAGIAN.
function pushbutton4_Callback(hObject, eventdata, handles)
global a;
global b;
axes(handles.firstImage);
imshow(a);
axes(handles.secondImage);
imshow(b);

axes(handles.resultImage);
imshow(a / 0.5);


% --- INI FUNGSI TOMBOL AND.
function pushbutton5_Callback(hObject, eventdata, handles)
global a;
global b;

axes(handles.firstImage);
imshow(a);
axes(handles.secondImage);
imshow(b);

c = a;
[kolom, baris] = size(c);

for x = 1 : kolom
    for y = 1 : baris
        if b(x,y) < 1
            c(x,y) = b(x,y);
        end
    end
end

axes(handles.resultImage);
imshow(c);


% --- INI FUNGSI TOMBOL OR.
function pushbutton6_Callback(hObject, eventdata, handles)
global a;
global b;
axes(handles.firstImage);
imshow(a);
axes(handles.secondImage);
imshow(b);

z = b;
[kolom, baris] = size(z);

for x = 1 : kolom
    for y = 1 : baris
        if z(x,y) < 1
            z(x,y) = a(x,y);
        end
    end
end

axes(handles.resultImage);
imshow(z);


% --- INI FUNGSI TOMBOL XOR
function pushbutton7_Callback(hObject, eventdata, handles)
global a;
global b;

bw1 = a > 98;
bw2 = b > 98;

axes(handles.firstImage);
imshow(bw1);
axes(handles.secondImage);
imshow(bw2);

g = bw1;
[kolom, baris] = size(g);

for x = 1 : kolom
    for y = 1 : baris
        if bw2(x,y) ~= 0
            if g(x,y) == 0
                g(x,y) = 1;
            else
                g(x,y) = 0;
            end
        end
    end
end

axes(handles.resultImage);
imshow(g);



% --- INI FUNGSI TOMBOL NOT
function pushbutton8_Callback(hObject, eventdata, handles)
global a;
global b;

bw1 = a > 98;
bw2 = b > 98;

axes(handles.firstImage);
imshow(bw1);

axes(handles.secondImage);
imshow(bw2);

r = bw1;
[kolom, baris] = size(r);

for x = 1 : kolom
    for y = 1 : baris
        if r(x,y) == 0
            r(x,y) = 1;
        else
            r(x,y) = 0;
        end
    end
end

axes(handles.resultImage);
imshow(r);


% --- INI FUNGSI TOMBOL PENSEKALAAN
function pushbutton9_Callback(hObject, eventdata, handles)
global a;
global b;
axes(handles.firstImage);
imshow(a);
axes(handles.secondImage);
imshow(b);

[kolom,baris] = size(a);

Sp = 2;
Sq = 1;
g = zeros(kolom,baris);

for x = 1 : kolom
    for y = 1 : baris
        x2 = x * Sp;
        y2 = y * Sq;
        g(x2,y2) = a(x,y);
    end
end

axes(handles.resultImage);
imshow(uint8(g));



% --- INI FUNGSI TOMBOL REFLEKSI
function pushbutton10_Callback(hObject, eventdata, handles)
global a;
global b;

axes(handles.firstImage);
imshow(a);
axes(handles.secondImage);
imshow(b);

[kolom,baris] = size(a);
g = zeros(kolom,baris);

for x = 1 : kolom
    for y = 1 : baris
        x2 = x;
        y2 = baris + 1 -y;
        g(x2,y2) = a(x,y);
    end
end

axes(handles.resultImage);
imshow(uint8(g));
