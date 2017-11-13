function [ returnMat, labels ] = getMatrix( fileDir )
%% GETMATRIX
% ͨ������img2vector����ѵ�������Ͳ�������ת��Ϊ����
dirStruct = dir(fileDir);
dirStruct(1) = []; dirStruct(1) = [];   % ʹ��dirStruct.name��Ϊ�ļ�������

len = length(dirStruct);
returnMat = zeros(len, 1024);
labels = zeros(1, len);

for i = 1: len
    filename = dirStruct(i).name;
    fileStr = regexp(filename, '\.', 'split');  fileStr = char(fileStr(1));
    classNum = regexp(fileStr, '_', 'split');  classNum = str2double(classNum(1));
    returnMat(i, :) = img2vector([fileDir, '\', filename]);
    labels(i) = classNum;
end


end

