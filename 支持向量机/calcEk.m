function [ Ek ] = calcEk( oS, k )
%% CALCEK
% ���ڸ�����alphaֵ�������Ek
fXk = (oS.alphas .* oS.labelMat)' * (oS.X * oS.X(k, :)') + oS.b;
Ek = fXk - os.labelMat(k);


end

