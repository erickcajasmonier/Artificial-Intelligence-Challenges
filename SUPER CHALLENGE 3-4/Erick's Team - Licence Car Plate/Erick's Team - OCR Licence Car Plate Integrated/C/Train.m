function C=Train(a1)
%  a1=imread('1.bmp')
a1=rgb2gray(a1);
a1=im2bw(a1);
a1=im2double(a1);
% a1= imresize(a1, [45 24]);
aa=imcomplement(a1);
[L1 num1]=bwlabel(a1);
stats1 = regionprops(aa, 'Image'); % get image features
c = stats1(1);
C = [c.Image];
C= imresize(C, [45 24]);
C=imcomplement(C);
 close all;
 imshow(C,[]);

return