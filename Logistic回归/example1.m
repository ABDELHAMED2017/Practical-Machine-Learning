clc, clear;
%% ʹ��Logistics�ݶȻع������������ж�άƽ���ϵĵ����
% ׼�����ݼ�
load('testSet.txt');
[m, n] = size(testSet);
dataMatIn = [ones(m, 1), testSet(:, 1:n-1)];
classLabels = testSet(:, n);
% ʹ���ݶ������㷨
% weights = gradAscend(dataMatIn, classLabels);
% ʹ���ݶ����������
% weights = stocGradAscent0(dataMatIn, classLabels);
% ʹ�øĽ��ݶ����������
weights = stocGradAscent1(dataMatIn, classLabels, 150);

% �������߽߱�
scatter(dataMatIn(:, 2), dataMatIn(:, 3), 80, classLabels, 'filled')
hold on
syms x
y = @(x) (-weights(1)-weights(2)*x)/weights(3);
fplot(y, [-4, 4])
