function [R] = rotZYXd(theta,phi,gamma)
% Brief: Rotation ZYX Tait-Bayan in degrees
% Details:
%    Rotation Composition of roll-pitch-yaw where theta, phi and gamma are
%    in degrees
% 
% Syntax:  
%     [R] = rotZYXd(theta,phi,gamma)
% 
% Inputs:
%    theta - scalar, numeric or sym, angle rotation z in degrees
%    phi - scalar, numeric or sym, angle rotation y in degrees
%    gamma - scalar, numeric or sym, angle rotation z in degrees
% 
% Outputs:
%    R - 3,3], numeric/sym, Rotation Matrix
% 
% 
% See also: rotZYZd, rotZYXr

% Author:                          Michele Di Lecce
% Email:                           elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
% Created:                         06-Oct-2022 00:10:40
% Version history revision notes:
%                                  None
% Implementation In Matlab R2022b
% Copyright © 2022 Storm Lab UK, University of Leeds.All Rights Reserved.
%
    arguments
        theta {mustBeScalarOrEmpty,mustBeA(theta,["numeric","sym"])} = syms('theta','real')
        phi {mustBeScalarOrEmpty,mustBeA(phi,["numeric","sym"])} = syms('phi','real')
        gamma {mustBeScalarOrEmpty,mustBeA(gamma,["numeric","sym"])} = syms('gamma','real')
    end

    R = rotzd(theta)*rotyd(phi)*rotxzzd(gamma);
    
end