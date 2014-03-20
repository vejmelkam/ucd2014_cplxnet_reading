
% 
% Implements the speaker/listener bidirectional/unidirectional
% communication.  Models speaker conviction and listener susceptibility.
% 
% synopsis: [l,s] = dialog_model(l0,s0,type)
% 

function [l,s] = dialog_model3(s0,l0,type)
    l = l0 + 2*s0./(1+l0.^2);
    s = s0 + 2*(type-1)*l0./(1+s0.^2);
end