clc, clear
%% ��������֢Ԥ�ⲡ���������
load('horseColicTraining.txt');
TrainSet = horseColicTraining(:, 1:size(horseColicTraining, 2)-1);
TrainLabel = horseColicTraining(:, size(horseColicTraining, 2));

load('horseColicTest.txt');
TestSet = horseColicTest(:, 1:size(horseColicTest, 2)-1);
TestLabel = horseColicTest(:, size(horseColicTest, 2));
[numTestVec, ~] = size(TestSet);

trainWeights = stocGradAscent1(TrainSet, TrainLabel, 500);

errCount = 0;
for i = 1:numTestVec
    if classifyVector(TestSet(i, :), trainWeights) ~= TestLabel(i)
        errCount = errCount + 1;
    end
end
errRate = errCount / numTestVec;
disp(['�����Ϊ��', num2str(errRate)]);