
%
% Plots figures indicating trajectory for different 'c' ratios of p_b to
% p_a.  Displays a dynamical analysis for p_a taking values from pas and
% p_b computed as p_a*c.  Also computes, displays and returns the value of
% the 'magnetization' for each situation starting from a point
% [p_a,p_b,0,1-p_a-p_b,0].
%
% synopsis: ms = onet_linear_trajectories(pas, c)
%

function ms = onet_linear_trajectories(pas, c)

    figure('Position', [100, 100, 900, 700]);

    Nfigs = length(pas);
    rows = ceil(sqrt(Nfigs));
    cols = ceil(Nfigs/rows);
    ms = zeros(Nfigs,1);
    for i=1:Nfigs
        p_a = pas(i);
        subplot(rows,cols,i);
        onet_analyze_dynamics(p_a, c*p_a, 0.1);
        axis([0 0.9 0 0.9]);
        xy = onet_integrate(p_a,c*p_a,0,1-p_a-c*p_a,100);
        m = (xy(end,2) - xy(end,1)) ./ (1 - p_a - c * p_a);
        title(sprintf('p_a=%g p_b=%g m=%g', p_a, c*p_a, m));
        ms(i) = m;
    end

end
