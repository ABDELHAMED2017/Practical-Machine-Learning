function [ entropy ] = calcEntropy( dataSet, labels )
%% CALCENTROPY
% ����������ݼ�����ũ��
% dataSet�Ǹ��������ݼ����� labels��dataSet������Ӧ���������
[m, ~] = size(dataSet);
labelMap = containers.Map;
% ����ļ�ֻ�����ַ�����Ȼ���ַ������������ڣ�ֻ��cell�� ��ô�죿
for i = 1: m
    currentLabel = labels(i);
    if ~labelMap.isKey(currentLabel)
        labelMap(currentLabel) = 0;
    end
    labelMap(currentLabel) = labelMap(currentLabel) + 1;
end
probMat = cell2mat(labelMap.values) / m;
entropy = -sum(probMat .* log(probMat));


end

