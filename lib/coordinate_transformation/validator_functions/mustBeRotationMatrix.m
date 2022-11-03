function mustBeRotationMatrix(R)
%UNTITLED2 - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = UNTITLED2(input1, input2)
%       output = UNTITLED2(input1, input2, input3)
%
%   Description:
%       UNTITLED2() - description
%    
%   Inputs:
%       input1 - Description
%
%   Outputs:
%       output1 - Description
%
%   Examples: 
%       Line 1 of example
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

%   Author: Michele Di Lecce
%   email: elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
%   Date: 03-Nov-2022; Last revision: 03-Nov-2022
%
%   % Implementation In Matlab R2022b
%   Copyright (c) 2022, Michele Di Lecce, Storm Lab UK, University of Leeds
%   All rights reserved.

    arguments
        R (3,3) {mustBeReal}
    end

    % Test for Orthonormal
    if ~isequal(R*transpose(R),eye(3))
        eid = 'RotationMatrix:notOrthonormal';
        msg = 'The rotation matrix is not Orthonormal';
        throwAsCaller(MException(eid,msg))
    end

end
