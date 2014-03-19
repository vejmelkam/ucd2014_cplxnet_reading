
%
% Computes a trajectory of the mean field model starting from
% the point (pa,pb,na,nb,1-pa-pb-na-nb).  Integration period is from 0 to
% Tmax.
%
% The function additionally (in a very simple manner) classifies the
% equilibrium toward which the trajectory converges as being either high
% na/low nb (1), high nb/low na (3) or mid na/mid nb (2).
%
% synopsis: [xy,eqid] = onet_integrate(pa,pb,na,nb,Tmax)
%
%

function [xy,eqid] = onet_integrate(pa,pb,na,nb,Tmax)
    traj = ode45(@(t,x) onet_model(pa,pb,x), [0,Tmax], [na,nb]);
    xy = traj.y';
    if((abs(xy(end,1) -xy(end,2)) > 0.2 * (1 - pa - pb)))
        if(xy(end,1) > xy(end,2))
            eqid = 1;
        else
            eqid = 3;
        end
    else
        eqid = 2;
    end
end
