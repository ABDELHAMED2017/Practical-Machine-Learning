function [ label ] = classifyVector( inX, weights )
%% CLASSIFYVECTOR
% ����prob������Ԥ�����
prob = sigmoid(sum(inX .* weights));
if prob > 0.5
    label = 1;
else
    label = 0;


end

