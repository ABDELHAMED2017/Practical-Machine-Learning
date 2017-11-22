function [ weakClassArr ] = AdaBoostTrainDS( dataArr, classLabels, numIt)
%% ADABOOSTTRAINDS
% ���ڵ����������AdaBoostѵ������
weakClassArr = containers.Map;
m = size(dataArr, 1);
D = ones(m, 1) / m;
aggClassEst = zeros(m, 1);

for i = 1:numIt
    [bestStump, error, classEst] = buildStump(dataArr, classLabels, D);
    fprintf('D: '); disp(D');
    alpha = 0.5 * log((1 - error) / max(error, 1e-16));
    bestStump('alpha') = alpha;
    
    % weakClassArr = [weakClassArr, bestStump];
    % weakClassArr = bestStump;   % MATLAB��Map��֧��ˮƽ������ֻ��ÿ�ν����µ�map������
    str = char(['weakClassArr', num2str(i), '=bestStump;']);
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

end

