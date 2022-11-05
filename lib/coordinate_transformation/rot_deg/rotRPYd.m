function [R] = rotRPYd(theta,phi,gamma)
% Brief: Rotation RPY Tait-Bayan in degrees
% Details:
%    Rotation Composition of roll-pitch-yaw where theta, phi and gamma are
%    in degrees
% 
% Syntax:  
%     [R] = rotRPYd(theta,phi,gamma)
% 
% Inputs:
%    theta - scalar, numeric or sym, angle rotation z in degrees
%    phi - scalar, numeric or sym, angle rotation y in degrees
%    gamma - scalar, numeric or sym, angle rotation x in degrees
% 
% Outputs:
%    R - 3,3], numeric/sym, Rotation Matrix
% 
% 
% See also: rotZYZd, rotRPYr

% Author:                          Michele Di Lecce
% Email:                           elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
% Created:                         06-Oct-2022 00:10:40
% Version history revision notes:
%                                  None
% Implementation In Matlab R2022b
% Copyright © 2022 Storm Lab UK, University of Leeds.All Rights Reserved.
%

    R = rotzd(theta)*rotyd(phi)*rotxd(gamma);
    
end