clc, clear;
%% �������������ݼ��ϣ����ڵ������������������������ʹ��AdaBoostԪ�㷨�Ľ�
load('horseColicTraining2.txt');
dataMat = horseColicTraining2(:, 1:21);
classLabels = horseColicTraining2(:, 22)';

%% ���ڵ����������AdaBoostѵ������:���classifierArri
% weakClassArr = containers.Map;
disp('���ڵ����������AdaBoostѵ�����̣�');
m = size(dataMat, 1);
D = ones(m, 1) / m;
aggClassEst = zeros(m, 1);
numIt = 50;

for i = 1:numIt
    [bestStump, error, classEst] = buildStump(dataMat, classLabels, D);
    % fprintf('D: '); disp(D');
    alpha = 0.5 * log((1 - error) / max(error, 1e-16));
    bestStump('alpha') = alpha;
    
    % weakClassArr = [weakClassArr, bestStump];
    % weakClassArr = bestStump;   % MATLAB��Map��֧��ˮƽ������ֻ��ÿ�ν����µ�map������
    str = char(['classifierArr', num2str(i), '=bestStump;']);
    eval(str);
    
    % fprintf('classEst: '); disp(classEst');
    expon = (-alpha * classLabels') .* classEst;
    
    D = D .* exp(expon);
    D = D / sum(D);

    aggClassEst = aggClassEst + alpha * classEst;
    % fprintf('aggClassEst: '); disp(aggClassEst');
    aggErrors = ((sign(aggClassEst) ~= classLabels')) .* ones(m, 1);
    errorRate = sum(aggErrors) / m;
    fprintf('total error: %f\n', errorRate);
    if errorRate == 0
        break;
    end
end

%% AdaBoost���ຯ��
% ������򵥵����ݼ��ϣ�ֻ���������Σ���˽�������forѭ����3�������µ����ݼ���Ҫ��������ѭ���������������������ĸ�����

disp('���µ����ݼ���Ӧ�������ڸ����ݼ��Ĳ���������');

% Ԥ��������
load('horseColicTest2.txt');
dataToClass = horseColicTest2(:, 1:21);
dataTrueLabel = horseColicTest2(:, 22);           % Ԥ������������ʵ���

aggClassEst = zeros(size(dataToClass, 1), 1);
for i = 1: 50
    str1 = char(['classEst=stumpClassify(dataToClass,classifierArr', int2str(i), ...
    '(''dim''),', 'classifierArr', int2str(i), '(''thresh''),', 'classifierArr', int2str(i), '(''ineq''));']);
    eval(str1);
    str2 = char(['aggClassEst=aggClassEst+classifierArr', int2str(i), '(''alpha'')*classEst;']);
    eval(str2);
    % fprintf('���������(������ʽ): '); disp(aggClassEst');
    % fprintf('���������(���): '); disp(sign(aggClassEst'));
end

fprintf('������������');
disp(size(find(sign(aggClassEst) ~= dataTrueLabel), 1));
fprintf('��������ʣ�');
disp(size(find(sign(aggClassEst) ~= dataTrueLabel), 1)/size(dataTrueLabel, 1));