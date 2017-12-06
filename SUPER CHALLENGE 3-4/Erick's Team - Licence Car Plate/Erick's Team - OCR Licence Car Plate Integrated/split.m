function I=split(a);

[r c p]=size(a);
if p==3
    a=rgb2gray(a);
end

aaa=a;

for i=1:r
    for j=1:c
        dd=a(i,j);
        if dd >125
        Out(i,j)=255;        
    else
        Out(i,j)=0;
    end
        
    end
end
a=Out;

 b=im2bw(a);
c=imcomplement(b);

[L num]=bwlabel(c);
STATS = regionprops(L,'all');
disp(num);


removed=0;

    disp(num);
    [L1 num1]=bwlabel(L);

for i=1:num1


end
  disp(num1);

  
  [L2 num2]=bwlabel(L1);
      STATS = regionprops(L1,'Area');
      
      Data=[];
		for i=1:num2
		Data1=STATS(i).Area
		
		Data=[Data Data1];
		
		end
        
        Data2=-sort(-Data);
        
        Data3=Data2(1:9);
        

AreaData=min(Data3);
removed=0;
for i=1:num
dd=STATS(i).Area;
if dd < AreaData
  	L(L==i)=0;
	removed = removed + 1;
    num=num-1;
else

end
    
    
end

  
 [L2 num2]=bwlabel(L);
 disp(num2);
  
stats1 = regionprops(L2, 'Image'); % get image features
C = [];
str='.bmp';
for j=1:1:(num2)
    c = stats1(j);
    C{j} = [c.Image]; % sepreate diffrent objects into C cell array.

    EE = imresize(C{j}, [45 24]);

    EE=imcomplement(EE);

     C{j}=EE;

    [r c]=size(EE);
    dd=zeros(r,c);

end
I=C;

