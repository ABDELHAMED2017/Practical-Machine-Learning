function [ weights ] = gradAscend( dataMatIn, classLabels )
%% GRADASCEND
% ʹ���ݶȻع���������ȷ��Ȩ��
% dataMatIn��m����n�����Ե�����,classLabels�Ƕ�Ӧ��������
[~, n] = size(dataMatIn);
alpha = 0.001;
maxCycles = 500;
weights = ones(n, 1);
for i = 1: maxCycles
    h = sigmoid(dataMatIn * weights);
    error = classLabels - h;
    weights = weights + alpha * dataMatIn' * error;
end

end

