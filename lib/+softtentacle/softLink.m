classdef softLink < softtentacle.softTentacleHandle
    %softLinkAbstract - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   UNTITLED4 constructor syntax:
    %       UNTITLED4_OBJ = UNTITLED4()
    %
    %   UNTITLED4 properties/attributes:
    %       Property - description
    %
    %   UNTITLED4 methods/functions:
    %       Method 1 - description
    %
    %   Examples:
    %       Line 1 of example
    %
    %   Other m-files required: none
    %   MAT-files required: none
    %
    %   See also: OTHER_CLASS_NAME1,  OTHER_CLASS_NAME2

    %   Author: Michele Di Lecce
    %   email: elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
    %   Date: 12-Oct-2022; Last revision: 12-Oct-2022
    %
    %   Version history revision notes:
    %                                  None
    %
    %   % Implementation In Matlab R2022b
    %   Copyright (c) 2022, Michele Di Lecce, Storm Lab UK, University of Leeds
    %   All rights reserved.  

    properties (SetAccess=immutable)
        Name (1,1) {mustBeTextScalar} = "Soft Link"
        Length (1,1) {mustBeReal,mustBePositive} = 1
        Diameter (1,1) {mustBeReal,mustBePositive} = 1   
        R0 (3,3) {mustBeReal} = eye(3)

        Mass (1,1) {mustBeReal,mustBePositive} = 1
        Inertia (3,3) {mustBeReal} = 1

        DistalLink = nan;
        ProximalLink = nan;
    end

    methods 

        function obj = softLink(name,length,diameter,varargin)
            
            %Parse Input
            p = inputParser;

            isstringorchar = @(x) isstring(x)&&isscalar(x)||ischar(x);
            isnumericpos = @(x) isnumeric(x)&&isscalar(x)&&x>=0;
            
            addRequired(p,'name',isstringorchar);
            addRequired(p,'length',isnumericpos);
            addRequired(p,'diameter',isnumericpos);
            addOptional(p,'initOrient',eye(3)...
                @(x) isnumeric(x)&&...
                (numel(x)==3||numel(x)==4)&&isvector(x)||...
                isequal(size(x),[3,3]));
            addOptional(p,'EulerOrder','XZX',...
                @(x) isstringorchar(x)&&numel(char(x))==3&&...
                matches(lower(x),["xzx","rpy"]));
            addOptional(p,'ProximalLink',nan,@(x)isnan(x)||isa(x,softLink);
            addOptional(p,'DistalLink',nan,@(x)isnan(x)||isa(x,softLink);


            p.KeepUnmatched = true;
            parse(p,name,length,diameter,varargin{:});

            obj.Name = p.Results.name;
            obj.Length = p.Results.length;
            obj.Diameter = p.Results.diameter;
            
            initOrder = p.Results.initOrient;

            switch size(initOrder)
                case [3,3]
                    obj.R0 = initOrder;
                case {[1,4],[4,1]}
                    if vecnorm(initOrder) == 1
                        obj.R0 = rotq(initOrder);
                    end
                case {[1,3],[3,1]}
                   euler = lower(char(p.Results.EulerOrder));
                   switch euler
                       case "rpy"
                           obj.R0 = rotZYXd(initOrder);
                       otherwise
                           obj.R0 = rotZXZd(initOrder);
                   end
                otherwise
                    obj.R0 = eye(3);
            end
            
            obj.ProximalLink = p.Results.ProximalLink;
            obj.DistalLink = p.Results.DistalLink;

        end
       
    end

%     methods (Abstract,Access=protected)
% 
%         evaluateInertia()
%         evaluateMass()
%     end
end
