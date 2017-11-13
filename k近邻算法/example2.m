clc, clear;
%% ʹ�ð���2��Լ����վ��Ϣ����
load('datingTestSet2.txt');
datingDataMat = datingTestSet2(:, 1:3);
datingLabels = datingTestSet2(:, 4)';

% ��������
scatter(datingDataMat(:, 2), datingDataMat(:, 3), 50, datingLabels, 'filled')

% ����Ԥ������һ��
stdData = mapminmax(datingDataMat', 0, 1)';

% ���ѡȡ10%��Ϊ���Լ�
tmp = randperm(1000);
testIndex = tmp(1:100);
testSet = stdData(testIndex, :);
testLabels = datingLabels(testIndex);

% ʣ�����Ϊѵ����
trainIndex = setdiff(1:1000, testIndex);
trainSet = stdData(trainIndex, :);
trainLabels = datingLabels(trainIndex);
errNum = 0;
for i = 1:100
    result = classify0(testSet(i,:), trainSet, trainLabels, 3);
    if result ~= testLabels(i)
        errNum = errNum + 1;
    end
end
disp('�����Ϊ');
disp(errNum / 100);