function [ j ] = selectJRand( i, m )
%% SELECTJRAND
% ���ѡ��һ������i��alpha�±�
j = i;
while j == i
    j = unidrnd(m);
end


end

