classdef softTentacle < softtentacle.softTentacleHandle
    %UNTITLED - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   UNTITLED constructor syntax:
    %       UNTITLED_OBJ = UNTITLED()
    %
    %   UNTITLED properties/attributes:
    %       Property - description
    %
    %   UNTITLED methods/functions:
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
    %   Date: 02-Nov-2022; Last revision: 02-Nov-2022
    %
    %   % Implementation In Matlab R2022b
    %   Copyright (c) 2022, Michele Di Lecce, Storm Lab UK, University of Leeds
    %   All rights reserved.


    properties (SetAccess = private)
         NumLinks {mustBeNumeric,mustBePositive} = 0
         Links {softtentacle.softLink.mustBeSoftLink}
         Base {mustBeA("softtenacle.softLink")} = softLink    
    end
    
    methods
    end

end
