
%
% Implements the speaker/listener bidirectional/unidirectional
% communication.
%
% synopsis: [s,l] = dialog_model(s0,l0,type)
%
%

function [s,l] = dialog_model1(s0,l0,type)
    l = l0 + abs(s0).*(s0-l0)/pi./(1+l0.^2);
    s = s0 + (type-1)*abs(l0).*(l0-s0)/pi./(1+s0.^2);
end