clc, clear;
%% ʹ�ð���3����дʶ��ϵͳ
% ��ȡѵ�����Ͳ��Լ�
[trainSet, trainLabels] = getMatrix('trainingDigits');
[testSet,     testLabels] = getMatrix('testDigits');

[m, ~] = size(testSet);
errCount = 0;
for i = 1: m
    classiferResult = classify0(testSet(i, :), trainSet, trainLabels, 3);
    if classiferResult ~= testLabels(i)
        errCount = errCount + 1;
    end
end

disp('���������Ϊ��');
disp(errCount/m);