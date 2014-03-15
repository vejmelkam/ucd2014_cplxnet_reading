

function onet_integrate(pa,pb,na,nb,Tmax)
    traj = ode45(@(t,x) onet_model(pa,pb,x), [0,Tmax], [na,nb]);
    xy = traj.y';
    if((abs(xy(end,1) -xy(end,2)) > 0.5 * (1 - pa - pb)))
        if(xy(end,1) > xy(end,2))
            fmt = 'r-';
        else
            fmt = 'g-';
        end
    else
        fmt = 'b-';
    end
    plot(xy(:,1),xy(:,2), fmt, 'linewidth', 1.5);
    plot(xy(end,1),xy(end,2), 'ko', 'markersize', 8, 'markerfacecolor', 'k');
end
