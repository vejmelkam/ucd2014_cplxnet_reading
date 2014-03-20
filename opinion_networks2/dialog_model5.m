
%
% Implements the speaker/listener bidirectional/unidirectional
% communication, model 5 (with saturation of speaker's ability to convince)
% and with a stochastic term to model 'conversation volatility'.
%
% synopsis: [l,s] = dialog_model(l0,s0,type)
%
%

function [l,s] = dialog_model5(s0,l0,type)
    eta = 0.05*randn(1,2);
    l = l0 + atan(s0)./(1+l0.^2) + eta(1);
    s = s0 + (type-1)*atan(l0)./(1+s0.^2) + eta(2);
end