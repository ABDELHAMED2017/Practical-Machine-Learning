clc, clear;
%% �ڼ����ݼ��ϣ����ڵ������������������������ʹ��AdaBoostԪ�㷨�Ľ�
dataMat = [1, 2.1; 
    2, 1.1; 
    1.3, 1; 
    1,    1; 
    2,    1];
classLabels = [1 1 -1 -1 1];
D = ones(5, 1) / 5;
[ bestStump, minError, bestClassEst ] = buildStump(dataMat, classLabels, D);
% ���������������
values(bestStump)