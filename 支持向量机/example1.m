clc, clear
%% �����ԿɷֵĶ�άƽ����Ӧ��֧��������
load('testSet.txt');
dataMat = testSet(:, 1:2);
labelMat = testSet(:, 3);

[b, alphas] = smoSimple(dataMat, labelMat, 0.6, 0.001, 40);

% ���֧������
[m, ~] = size(alphas);
for i = 1: m
    if alphas(i) > 0
        disp([dataMat(i, :), labelMat(i)]);
    end
end
