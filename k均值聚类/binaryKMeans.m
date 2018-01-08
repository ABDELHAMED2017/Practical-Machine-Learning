function [ centList, clusterAssment ] = binaryKMeans( dataSet, k )
%% BINARYKMEANS
% ����kMeans�����㷨
m = size(dataSet, 1);
clusterAssment = zeros(m, 2);    % ��һ�д洢���������Ĵ����ģ��ڶ���洢��������ô����ĵľ���
centroid0 = mean(dataSet, 1); centList = centroid0;
for j = 1:m
    clusterAssment(j, 2) = distEclud(centroid0, dataSet(j, :)) ^ 2;
    while length(centList) < k
        lowestSSE = inf;
        for i = 1:length(centList)
            ptsInCurrCluster = dataSet(clusterAssment(:, 1) == i, :);
            [centroidMat, splitClustAss] = kMeans(ptsInCurrCluster, 2);
            sseSplit = sum(splitClustAss(:, 2));
            sseNotSplit = sum(clusterAssment(clusterAssment(:, 1) ~= i, 2));
            fprintf('sseSplit: %f, sseNotSplit: %f\n', sseSplit, sseNotSplit);
            if (sseSplit + sseNotSplit) < lowestSSE
                bestCentToSplit = i;
                bestNewCents = centroidMat;
                bestClusterAss = splitClustAss;
                lowestSSE = sseSplit + sseNotSplit;
            end
        end
        bestClusterAss()


end

