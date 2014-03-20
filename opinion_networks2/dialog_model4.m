
%
% Implements the speaker/listener bidirectional/unidirectional
% communication, model 4 (with saturation).
%
% synopsis: [l,s] = dialog_model(l0,s0,type)
%
%

function [l,s] = dialog_model4(s0,l0,type)
    l = l0 + atan(s0)./(1+l0.^2);
    s = s0 + (type-1)*atan(l0)./(1+s0.^2);
end