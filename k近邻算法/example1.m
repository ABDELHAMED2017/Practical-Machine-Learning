clc, clear
%% ʹ�ð���1����άƽ���ϵĵ����
dataSet = [1.0, 1.1; 1.0, 1.0; 0, 0; 0, 0.1];
labels = [1, 1, 0, 0];
disp('���Ϊ��')
disp(classify0([0, 0], dataSet, labels, 3));