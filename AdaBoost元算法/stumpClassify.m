function [ retArray ] = stumpClassify( dataMatrix, dim, threshVal, threshIneq )
%% STUMPCLASSIFY
% ͨ����ֵ�Ƚ϶��������з���
retArray = ones(size(dataMatrix, 1), 1);
if threshIneq == 0    % 0��ʾlt: less than
    retArray(dataMatrix(:, dim) <= threshVal) = -1;
else                   % 1��ʾgt: greater than
    retArray(dataMatrix(:, dim) >  threshVal) = -1;
end


end

