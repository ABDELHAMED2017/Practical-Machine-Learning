function [ centroids ] = randCent( dataSet, k )
%% RANDCENT
% Ϊ�������ݼ�����һ������k��������ĵļ���
n = size(dataSet, 2);
centroids = zeros(k, n);
for j = 1:n
    minJ = min(dataSet(:, j));
    rangeJ = max(dataSet(:, j)) - minJ;
    centroids(:, j) = minJ + rangeJ * rand(k, 1);
end


end

