clc;
close all;
clear all;

global write;

matDim      = 16;
alphabetDim = 10;

while(true)
    num = input('Training data:');
    if num ~= -1
        write = zeros(matDim, matDim);
        inputPanel('start');
        cmd = input('Data saved');
        temp = [zeros(1, num) 1 zeros(1, alphabetDim - num - 1) write(:)'];
        dlmwrite('trainData.txt', temp, '-append');
    else
        clc;
        close all;
        clear all;
        break;
    end
end