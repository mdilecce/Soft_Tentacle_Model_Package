classdef softLinkAbstract < softtentacle.softTentacleHandle
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
        Name (1,1) {mustBeTextScalar} = ''
        Diameter (1,1) {mustBeReal,mustBePositive,mustBeScalar}
        Length (1,1) {mustBeReal,mustBePositive,mustBeScalar,mustBeReal,mustBePositive,mustBeScalar}
        Mass (1,1) {mustBeReal,mustBePositive,mustBeScalar}
        Inertia (3,3) {mustBeReal}
        Q0 (4,1) {mustBeReal}















        
    end



    methods (Abstract)
        
    end
end
