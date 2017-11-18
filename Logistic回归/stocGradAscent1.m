function [ weights ] = stocGradAscent1( dataMatrix, classLabels, iter )
%% STOCGRADASCENT0
% �Ľ�����ݶ������㷨�����ӵ���������ÿ�ε���alpha��ֵ
% dataMatrix��m����n�����Ե�����,classLabels�Ƕ�Ӧ��������,iterΪ��������
[m, n] = size(dataMatrix);
weights = ones(1, n);
for it = 1:iter
    for i = 1: m
        alpha = 4 / (1+it+i) + 0.01;
        randIndex = unidrnd(m);
        h = sigmoid(sum(dataMatrix(randIndex, :) .* weights));
        error = classLabels(randIndex) - h;
        weights = weights + alpha * dataMatrix(randIndex, :) * error;
    end
end



end

