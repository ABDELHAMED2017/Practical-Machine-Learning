function [ returnVect ] = img2vector( filename )
%% IMG2VECTOR 
% ��32*32��ͼ��(�ı�)ת��Ϊ1*1024������(��ֵ)
fr = fopen(filename, 'r');
returnVect = zeros(1, 1024);
for i = 1: 32
    lineStr = fgetl(fr);
    for j = 1: 32
        returnVect(1, 32*(i-1)+j) = str2double(lineStr(j));
    end
end
fclose(fr);


end

