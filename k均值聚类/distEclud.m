function [ dis ] = distEclud( vecA, vecB )
%% DISTECLUD
% ����ŷ����þ���
dis = sqrt(sum(power(vecA - vecB), 2));


end

