function [R] = rotxd(gamma)
% Brief: rotation matrix over the x axis
% Details:
%   Return the rotation matrix over the x axis for angle gamma(in degrees).  
%   Gamma is measured counter-clockwise in the y-z plane.
% 
% Syntax:  
%     [R] = rotxd(gamma)
% 
% Inputs:
%    gamma - scalar,numeric/sym,D Angle Rotation of the X axis
% 
% Outputs:
%    R - [3,3], numeric/sym, Rotation Matrix
% 
% 
% See also: rotyd, rotzd
%
% Author:                          Michele Di Lecce
% Email:                           elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
% Created:                         05-Oct-2022 16:43:39
% Version history revision notes:
%                                  None
% Implementation In Matlab R2022b
% Copyright © 2022 Storm Lab UK, University of Leeds.All Rights Reserved.
%
arguments
    gamma{mustBeScalarOrEmpty,mustBeA(gamma,["numeric","sym"])} = sym('gamma','real')
end

    R = [   1       0           0;
            0   cosd(gamma)  -sind(gamma);
            0   sind(gamma)  cosd(gamma)];
    
end