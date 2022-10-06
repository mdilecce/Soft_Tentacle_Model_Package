function [R] = rotZYZr(theta,phi,gamma)
% Brief: Rotation ZYZ in radiant
% Details:
%    Rotation Composition of rotz(theta)*roty(phi)*rotz(gamma) where theta
%    phi and gamma are angle in radiant
% 
% Syntax:  
%     [R] = rotZXZr(theta,phi,gamma)
% 
% Inputs:
%    theta - scalar, numeric or sym, angle rotation z in radiant
%    phi - scalar, numeric or sym, angle rotation y in radiant
%    gamma - scalar, numeric or sym, angle rotation z in radiant
% 
% Outputs:
%    R - 3,3], numeric/sym, Rotation Matrix
% 
% 
% See also: rotZYZr, rotZYXd

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

    R = rotzr(theta)*rotyr(phi)*rotzr(gamma);
    
end

