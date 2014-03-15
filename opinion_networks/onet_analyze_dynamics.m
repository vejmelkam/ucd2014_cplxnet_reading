
%
% Displays a quiver plot plus trajectories for a number of starting
% (na,nb) points, which are picked from 0 with a step of 'res' in both
% directions.  Default for res is 0.1
%
%
% synopsis: xie2012_analyze_dynamics(pa, pb,res)
%
function onet_analyze_dynamics(pa,pb,res)
    if(nargin < 3)
        res = 0.1;
    end
    onet_quiver(pa,pb,0.02);
    hold on
    for na=0:res:1.0
        for nb=0:res:1.0
            if(na+nb+pa+pb <= 1)
                onet_integrate(pa,pb,na,nb,500);
            end
        end
    end
    onet_integrate(pa,pb,pb,pa,500);
    hold off

end