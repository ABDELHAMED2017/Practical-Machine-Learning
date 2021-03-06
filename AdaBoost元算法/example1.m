clc, clear;
%% 在简单数据集上，基于单层决策树构建弱分类器，并使用AdaBoost元算法改进
dataMat = [1, 2.1; 
    2, 1.1; 
    1.3, 1; 
    1,    1; 
    2,    1];
classLabels = [1 1 -1 -1 1];

%% 基于单层决策树的AdaBoost训练过程:求出classifierArri
% weakClassArr = containers.Map;
disp('基于单层决策树的AdaBoost训练过程：');
m = size(dataMat, 1);
D = ones(m, 1) / m;
aggClassEst = zeros(m, 1);
numIt = 9;

for i = 1:numIt
    [bestStump, error, classEst] = buildStump(dataMat, classLabels, D);
    fprintf('D: '); disp(D');
    alpha = 0.5 * log((1 - error) / max(error, 1e-16));
    bestStump('alpha') = alpha;
    
    % weakClassArr = [weakClassArr, bestStump];
    % weakClassArr = bestStump;   % MATLAB中Map不支持水平串联，只好每次建立新的map保存结果
    str = char(['classifierArr', num2str(i), '=bestStump;']);
    eval(str);
    
    fprintf('classEst: '); disp(classEst');
    expon = (-alpha * classLabels') .* classEst;
    
    D = D .* exp(expon);
    D = D / sum(D);

    aggClassEst = aggClassEst + alpha * classEst;
    fprintf('aggClassEst: '); disp(aggClassEst');
    aggErrors = ((sign(aggClassEst) ~= classLabels')) .* ones(m, 1);
    errorRate = sum(aggErrors) / m;
    fprintf('total error: %f\n', errorRate);
    if errorRate == 0
        break;
    end
end

%% AdaBoost分类函数
% 在这个简单的数据集上，只迭代了三次，因此接下来的for循环是3，对于新的数据集需要重新设置循环次数（等于弱分类器的个数）
disp('在新的数据集上应用适用于该数据集的测试样本：');

dataToClass = [5, 5; 0, 0];      % 预分类样本

aggClassEst = zeros(size(dataToClass, 1), 1);
for i = 1: 3
    str1 = char(['classEst=stumpClassify(dataToClass,classifierArr', int2str(i), ...
    '(''dim''),', 'classifierArr', int2str(i), '(''thresh''),', 'classifierArr', int2str(i), '(''ineq''));']);
    eval(str1);
    str2 = char(['aggClassEst=aggClassEst+classifierArr', int2str(i), '(''alpha'')*classEst;']);
    eval(str2);
    fprintf('输出分类结果(概率形式): '); disp(aggClassEst');
    fprintf('输出分类结果(类标): '); disp(sign(aggClassEst'));
end