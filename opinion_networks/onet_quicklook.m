
%
% Call to construct a figure with ui controls for adjustment of pa and pb
% within [0,0.3] range.
%
%
function onet_quicklook

    %subplot(221);    
    onet_analyze_dynamics(0.1,0.1);
    set(gcf,'position',[50,800,700,600]);
    uicontrol('position', [10 10 30 20], 'style', 'text', 'string', 'p_a', 'fontsize', 12);
    h1 = uicontrol('position', [50 10 100 20],'style','slider','min',0,'max',0.3,'value',0.1,'callback', @update_dynamics);
    h3 = uicontrol('position', [160 10 50 20],'style','edit','min',0,'max',0.3,'string','0.1','callback', @update_dynamics_edit);
    
    uicontrol('position', [400 10 30 20], 'style', 'text', 'string', 'p_b', 'fontsize', 12);
    h2 = uicontrol('position', [450 10 100 20], 'style','slider','min',0,'max',0.3,'value',0.1,'callback', @update_dynamics);
    h4 = uicontrol('position', [560 10 50 20], 'style','edit','min',0,'max',0.3,'string','0.1','callback', @update_dynamics_edit);

    
    function update_dynamics(h,ev)
        pa = get(h1,'value');
        pb = get(h2,'value');
        set(h3,'string',num2str(pa));
        set(h4,'string',num2str(pb));
        onet_analyze_dynamics(pa,pb);
    end

    function update_dynamics_edit(h,ev)
        pa = str2double(get(h3,'string'));
        pb = str2double(get(h4,'string'));
        if(isempty(pa))
            pa = get(h1,'value');
        else
            set(h1,'value',pa);
        end
        if(isempty(pb))
            pb = get(h2,'value');
        else
            set(h2,'value',pb);
        end
        onet_analyze_dynamics(pa,pb);
    end

end



