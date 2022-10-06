function [q] = quat(R)
% Brief: Quaternions
% Details:
%    Return the quaternion q=(eta,epsilon) for a Rotation Matrix R
% 
% Syntax:  
%     [q] = quat(R)
% 
% Inputs:
%    R - [3,3], numeric/sym, Rotation Matrix
% 
% Outputs:
%    q - [4,1], numeric/sytm, quaternion
% 
% See also: rotq

% Author:                          Michele Di Lecce
% Email:                           elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
% Created:                         06-Oct-2022 02:37:59
% Version history revision notes:
%                                  None
% Implementation In Matlab R2022b
% Copyright © 2022 Storm Lab UK, University of Leeds.All Rights Reserved.
%
    arguments 
        R (3,3) {mustBeA(R,["numeric","sym"])} = sym('R',[3,3],'real')
    end
    q(1)=0.5*sqrt(sum(diag(R))+1);
    q(2)=0.5*sign(R(3,2)-R(2,3))*sqrt(R(1,1)-R(2,2)-R(3,3)+1);
    q(3)=0.5*sign(R(1,3)-R(3,1))*sqrt(R(2,2)-R(1,1)-R(2,2)+1);
    q(4)=0.5*sign(R(2,1)-R(1,2))*sqrt(R(3,3)-R(1,1)-R(2,2)+1);
end