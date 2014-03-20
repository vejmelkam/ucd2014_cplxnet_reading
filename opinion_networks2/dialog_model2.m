
%
% Implements the speaker/listener bidirectional/unidirectional
% communication.
%
% synopsis: [l,s] = dialog_model(l0,s0,type)
%
%

function [l,s] = dialog_model2(s0,l0,type)
    l = l0 + (3*s0-l0)./(2*pi*(1+l0.^2));
    s = s0 + (type-1)*(3*l0-s0)./(2*pi*(1+s0.^2));
end