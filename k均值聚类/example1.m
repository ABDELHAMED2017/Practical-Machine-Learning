clc, clear;
%% �ڶ�άƽ����Ӧ�þ����㷨
dataMat = load('testSet.txt');
[ centroids, clusterAssment ] = kMeans( dataMat, 4);

