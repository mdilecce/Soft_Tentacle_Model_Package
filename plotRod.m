classdef plotRod<handle

    properties
        fig = [];
        ax = [];
        l = {};
        nghosts = 0;
    end

    methods

        function obj=plotRod(w,label,argsAx)
           arguments  
               w {mustBeReal,mustBeScalarOrEmpty} = 0.2
               label {mustBeTextScalar} = string()
               argsAx.?matlab.graphics.axis.Axes 
               argsAx.XLim = [-w;w]/2;
               argsAx.YLim = [-w;w]/2;
               argsAx.ZLim = [-w;w]/2;
               argsAx.View = [45,45];
           end
           obj.createFig("Visible","on");
           if label == ""
                title(label);
           end
           argsAx = namedargs2cell(argsAx);
           obj.createAx(argsAx{:});           
        end
        
        function createFig(obj,argsFig)
            arguments 
                obj 
                argsFig.?matlab.ui.Figure      
            end
            argsFig = namedargs2cell(argsFig);
            obj.fig = figure(argsFig{:});
         end

         function createAx(obj,argsAx)
            arguments 
                obj 
                argsAx.?matlab.graphics.axis.Axes
            end
            argsAx = namedargs2cell(argsAx);
            obj.ax = axes(obj.fig,argsAx{:});
         end

         function addRodLine(obj,rod,argsLine)
            arguments
                obj
                rod {mustbeA(rod,"rodHandle")}
                argsLine.?matlab.graphics.chart.primitive.Line
            end
            argsLine = namedargs2cell(argsLine);
            [p,~,~,~]=rod.returnStatusDef();
            plot3(obj.ax,p(:,1),p(:,2),p(:,3),argsLine{:}); 
         end
    end

    methods (Access=private)

        function mustBeFig(f)
            if ~(isa(f,'matlab.ui.Figure')||isempty(f))
                eid = 'PlotRod:notFigureContainer';
                msg = 'Not a figure container';
                throwsAsCaller(MException(eid,msg))
            end
        end

        function mustBeAx(ax)
            if ~(isa(ax,'matlab.graphics.axis.Axes')||isempty(ax))
                eid = 'PlotRod:notAxes';
                msg = 'Not a Axes';
                throwsAsCaller(MException(eid,msg))
            end
        end

        function mustBeLine(l)
            if ~(isa(l,'matlab.graphics.primitive.chart.Line')||isempty(l))
                eid = 'PlotRod:notPrimitiveLine';
                msg = 'Not a Primitive Line';
                throwsAsCaller(MException(eid,msg))
            end
        end

    end
end