function [R] = rotq(q)
% Brief: Rotation matrix for the quaternion q = (v,epsilon)
% Details:
%    Return the rotation matrix for the quaternion using the Rodriques 
%    Formulation
%
% Syntax:  
%     [R] = rotq(eta,q(2:end))
% 
% Inputs:
%    q - [4,1], numeric/sytm, quaternion
% 
% Outputs:
%    R - [3,3], numeric/sym, Rotation Matrix
% 
% See also: quat

% Author:                          Michele Di Lecce
% Email:                           elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
% Created:                         06-Oct-2022 01:31:41
% Version history revision notes:
%                                  None
% Implementation In Matlab R2022b
% Copyright © 2022 Storm Lab UK, University of Leeds.All Rights Reserved.
%


    arguments 
        q (4,1) {mustBeQuaternion}
    end


    R = (q(1)^2-transpose(q(2:end))*q(2:end))*eye(3) + 2*q(1)*skew(q(2:end))+2*q(2:end)*transpose(q(2:end));
end