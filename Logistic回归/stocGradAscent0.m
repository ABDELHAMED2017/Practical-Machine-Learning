function [ weights ] = stocGradAscent0( dataMatrix, classLabels )
%% STOCGRADASCENT0
% �Ľ��ݶ������㷨��ʹ������ݶ������㷨����Ȩ��weights
% dataMatrix��m����n�����Ե�����,classLabels�Ƕ�Ӧ��������
[m, n] = size(dataMatrix);
alpha = 0.01;
weights = ones(1, n);
for i = 1: m
    h = sigmoid(sum(dataMatrix(i, :) .* weights));
    error = classLabels(i) - h;
    weights = weights + alpha * dataMatrix(i, :) * error;
end


end

