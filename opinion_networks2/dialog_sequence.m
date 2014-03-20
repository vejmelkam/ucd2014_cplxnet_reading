

function [l,s] = dialog_sequence(s0,l0,n,dlg_fun)
    l = zeros(n,1);
    s = zeros(n,1);
    l(1) = l0;
    s(1) = s0;
    for i=2:n
        [l(i),s(i)] = dlg_fun(s(i-1),l(i-1));
    end
end