function plotRefFrame(hAxes, R, varargin)


    p = inputParser;
    addRequired(p,'hAxes',@(x) isa(x,"matlab.graphics.axis.Axes"))
    addRequired(p,'R', @(x) isa(x,"stereoParameters") || isnumeric(x) &&  ismatrix(x));
    addOptional(p,'o',zeros(3,1),@(x) isnumeric(x) && numel(x)==3);
    addParameter(p,'scale',1,@isscalar);
    addParameter(p,'orderAxis',[1 2 3],@isvector);
    addParameter(p,'label',"",@isstring); 
    addParameter(p,'color',["r","g","b"],@isstring);
    addParameter(p,'LineWidth',1,@isscalar);
    parse(p,hAxes,R,varargin{:});

    o = p.Results.o;

    if isa(p.Results.R,"stereoParameters")
        R = p.Results.R.RotationOfCamera2;
        o = p.Results.R.TranslationOfCamera2;
    elseif size(p.Results.R,1)==4 && size(p.Results.R,2)==4
        [R,o] = tdecomp(p.Results.R);
    else
        R = p.Results.R;
    end
    
    R = p.Results.scale*R;
    idAx = p.Results.orderAxis;
    
    o=o(idAx);

    holdState = get(p.Results.hAxes,'NextPlot');
    set(p.Results.hAxes, 'NextPlot', 'add');
    col = p.Results.color;
    linewidth = p.Results.LineWidth;

    if size(o,2)==3

        R=R(:,idAx);
        quiver3(o(1),o(2),o(3),R(1,1),R(1,2),R(1,3),col(1),'LineWidth',linewidth)
        quiver3(o(1),o(2),o(3),R(2,1),R(2,2),R(2,3),col(2),'LineWidth',linewidth)
        quiver3(o(1),o(2),o(3),R(3,1),R(3,2),R(3,3),col(3),'LineWidth',linewidth)
        
        
        if p.Results.label~=""
            % label camera axis
            text(R(1,1)+o(1),R(1,2)+o(2),R(1,3)+o(3),compose('X_{%s}',p.Results.label),'FontWeight','bold','Parent', hAxes,'Color',col(1));
            text(R(2,1)+o(1),R(2,2)+o(2),R(2,3)+o(3),compose('Y_{%s}',p.Results.label),'FontWeight','bold', 'Parent', hAxes,'Color',col(2));
            text(R(3,1)+o(1),R(3,2)+o(2),R(3,3)+o(3),compose('Z_{%s}',p.Results.label),'FontWeight','bold', 'Parent', hAxes,'Color',col(3));    
        end

    else
        R=R(idAx,:);
        quiver3(o(1),o(2),o(3),R(1,1),R(2,1),R(3,1),col(1),'LineWidth',linewidth)
        quiver3(o(1),o(2),o(3),R(1,2),R(2,2),R(3,2),col(2),'LineWidth',linewidth)
        quiver3(o(1),o(2),o(3),R(1,3),R(2,3),R(3,3),col(3),'LineWidth',linewidth)
        
        if p.Results.label~=""
            % label camera axis
            text(R(1,1)+o(1),R(2,1)+o(2),R(3,1)+o(3),compose('X_{%s}',p.Results.label),'FontWeight','bold','Parent', hAxes,'Color',col(1));
            text(R(1,2)+o(1),R(2,2)+o(2),R(3,2)+o(3),compose('Y_{%s}',p.Results.label),'FontWeight','bold', 'Parent', hAxes,'Color',col(2));
            text(R(1,3)+o(1),R(2,3)+o(2),R(3,3)+o(3),compose('Z_{%s}',p.Results.label),'FontWeight','bold', 'Parent', hAxes,'Color',col(3));    
        end

    end
    set(p.Results.hAxes, 'NextPlot', holdState); % restore the state

end