function mustBeQuaternion(q)
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
%   Date: 04-Nov-2022; Last revision: 04-Nov-2022
%
%   % Implementation In Matlab R2022b
%   Copyright (c) 2022, Michele Di Lecce, Storm Lab UK, University of Leeds
%   All rights reserved.

    if ~isequal(size(q),[4,1])
        eid = 'quaternion:notSize';
        msg = 'The quaternion is not a vector 4x1';
        throwAsCaller(MException(eid,msg))
    end

    %Test Size
    if ~(isa(q,'numeric')||isa(q,'sym'))
        eid = 'Quaternion:notNumericOrSym';
        msg = 'The quaternion is not numeric or symbolic';
        throwAsCaller(MException(eid,msg))
    end

    %Text Norm Condition
    if vecnorm(q)~=1
        eid = 'Quaternion:normNotUnitary';
        msg = 'The norm of the quaternion is not unitary |q|=1';
        throwAsCaller(MException(eid,msg))
    end

end
