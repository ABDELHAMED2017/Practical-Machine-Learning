function [ aj ] = clipAlpha( aj, H, L )
%% CLIPALPHA
% ��alpha��ֵ�޶���һ����Χ��
if aj > H
    aj = H;
end
if aj < L
    aj = L;
end

end

