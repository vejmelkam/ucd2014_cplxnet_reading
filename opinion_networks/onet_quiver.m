
%
% Constructs a quiver plot (displays the vector field of the opinion
% network model for fixed pa and pb.  The vector field is displayed with a
% spatial resolution 'res' for na & nb.
%

function onet_quiver(pa,pb,res)
    if(nargin < 3)
        res = 0.05;
    end
    [na,nb] = meshgrid(0:res:1,0:res:1);
    N = size(na,1);
    u = zeros(size(na));
    v = zeros(size(nb));
    for i=1:N
        for j=1:N
            if(na(i,j) + nb(i,j) + pa + pb <= 1)
                dab = onet_model(pa,pb,[na(i,j),nb(i,j)]);
                u(i,j)=dab(1);
                v(i,j)=dab(2);
            end
        end
    end
    quiver(na,nb,u,v,3,'k-');
    axis([0 1 0 1]);
    xlabel('n_a','fontsize',12);
    ylabel('n_b','fontsize',12);
    title(sprintf('Naming game vector field with pa=%g pb=%g', pa,pb),'fontsize',14);
    
            