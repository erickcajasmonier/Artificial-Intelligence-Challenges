function C=Train(a1)
clc;
clear;
close all;

a1=imread('1.bmp');
figure;
imshow(a1);
a1=rgb2gray(a1);
a1=im2bw(a1);
figure;
imshow(a1);

a1=im2double(a1);
% a1= imresize(a1, [45 24]);
a1=imcomplement(a1);
figure;
imshow(a1);

[L1 num1]=bwlabel(a1);
figure;
imshow(L1);
stats1 = regionprops(L1, 'Image'); % get image features
c = stats1(1);
C = [c.Image];
C= imresize(C, [45 24]);
figure;
imshow(C);
C=imcomplement(C);
figure;
imshow(C);
close all;
imshow(C,[]);

return