function [ result ] = classify0( inX, dataSet, labels, k )
%% CLASSIFY0 
% ����ڷ���MATLABʵ��
% inX�Ǵ����������������dataSet��ѵ����������
% labels��ѵ�����������������kΪѡȡ�����ڽ�����
[rowNum, ~] = size(dataSet);
diffMat = repmat(inX, rowNum, 1) - dataSet;
distances = sqrt(sum(diffMat .* diffMat, 2));
[~, sortedDistancesIndicies] = sort(distances);

labelSize = numel(unique(labels));
classCount = [unique(labels)', zeros(labelSize, 1)];
for i = 1:k
    votelabel = labels(sortedDistancesIndicies(i));
    classCount(classCount(:,1) == votelabel, 2) = classCount(classCount(:,1) == votelabel, 2) + 1;
end
[~, optimalLoc] = max(classCount(:,2));
result = classCount(optimalLoc, 1);

end

