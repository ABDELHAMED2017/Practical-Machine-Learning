function [  ] = updateEk( oS, k )
%% UPDATEEK
% ����eCache�ı�־λ��Ekֵ
Ek = clacEk(oS, k);
oS.eCache(k) = [1, Ek];


end

