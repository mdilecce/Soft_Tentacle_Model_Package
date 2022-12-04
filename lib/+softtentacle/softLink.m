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
    
    %Specs Segment

    properties (SetAccess=immutable)

        Name (1,1) {mustBeTextScalar}
        Length (1,1) {mustBeReal,mustBePositive} 
        Diameter (1,1) {mustBeReal,mustBePositive}  
        R0 (3,3) {mustBeRotationMatrix} = eye(3)

        Mass (1,1) {mustBeReal,mustBePositive} = 0
        Inertia {mustBeReal} = 0

    properties (SetAccess={?softtentacle.softTentacleHandle})
        %Neighboor Links
        DistalLink {mustBeScalarOrEmpty,mustBeSoftLink} = [];
        ProximalLink {mustBeScalarOrEmpty,mustBeSoftLink} = [];
    end

    %Current State
    properties (Access={?softtentacle.softTentacleHandle})
        
        P (3,1) {mustBeReal}
        Q (4,1) {mustBeReal,mustBeQuaternion}
        f (3,1) {mustBeReal}
        tau (3,1) {mustBeReal}
        
    end

    methods 

        function obj = softLink(name,length,diameter,...
                initOrient,neighboorLink)

            arguments
                name {mustBeTextScalar}
                length (1,1) {mustBeReal,mustBePositive} = 0
                diameter (1,1) {mustBeReal,mustBePositive} = 0
                initOrient.R0 (3,3) {mustBeRotationMatrix}
                initOrient.Theta0 (3,1) {mustBeReal}
                initOrient.EulerAngles {mustBeEulerOrder} = "RPY"
                initOrient.Q0 (4,1) {mustBeReal,mustBeQuaternion}
                neighboorLink.DistalLink {mustBeScalarOrEmpty,mustBeSoftLink} = [];
                neighboorLink.ProximalLink {mustBeScalarOrEmpty,mustBeSoftLink} = [];
            end

            obj.Name = name;
            obj.Diameter = diameter;
            obj.Length = length;

            if isfield(initOrient,"R0")
                obj.R0 = initOrient.R0;
            elseif isfield(initOrient,"Q0")
                obj.R0 = rotq(initOrient.Q0);
            elseif isfield(initOrient,"Theta0")
                obj.R0 = feval(strcat("rot",upper(initOrient),"d"),...
                    initOrient.Theta0);
            end

            obj.DistalLink = neighboorLink.DistalLink;
            obj.ProximalLink = neighboorLink.ProximalLink;
            
        end
      
    end

%     methods (Abstract,Access=protected)
% 
%         evaluateInertia()
%         evaluateMass()
%     end

    methods (Static, Access={?softtentacle.softTentacleHandle})

        %Validation Functions
        function mustBeSoftLink(link)
            % Test Soft Link Size
            if ~isempty(link)&&isa(link,"softtentacle.softLink")
                eid = 'SoftLink:notSoftLink';
                msg = 'Inputs must be empty or scalar SoftLink.';
                throwAsCaller(MException(eid,msg))
            end
        end
        
    end

end
