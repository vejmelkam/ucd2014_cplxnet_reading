
%
% Displays a quiver plot plus trajectories for a number of starting
% (na,nb) points, which are picked from 0 with a step of 'res' in both
% directions.  Default for res is 0.1
%
%
% synopsis: xie2012_analyze_dynamics(pa, pb,res)
%
function fs = onet_analyze_dynamics(pa,pb,res)
    if(nargin < 3)
        res = 0.1;
    end
    fmts = { 'r-', 'b-', 'g-' };
    onet_quiver(pa,pb,0.02);
    hold on
    rng = 0:res:1.0;
    fs = zeros(length(rng)^2,2);
    ndx = 1;
    for na=rng
        for nb=rng
            if(na+nb+pa+pb <= 1)
                [xy,eqid] = onet_integrate(pa,pb,na,nb,500);
                plot(xy(:,1),xy(:,2), fmts{eqid}, 'linewidth', 1.5);
                plot(xy(end,1),xy(end,2), 'ko', 'markersize', 8, 'markerfacecolor', 'k');
                fs(ndx,:) = [xy(end,1),xy(end,2)];
                ndx = ndx + 1;
            end
        end
    end
    hold off
    fs = fs(1:ndx-1,:);
end