function [R] = rotzr(theta)
% Brief: rotation matrix over the x axis
% Details:
%   Return the rotation matrix over the x axis for angle theta(in radiantss).  
%   theta is measured counter-clockwise in the z-x plane.
% 
% Syntax:  
%     [R] = rotzr(theta)
% 
% Inputs:
%    theta - scalar,numeric/sym,D Angle Rotation of the X axis
% 
% Outputs:
%    R - [3,3], numeric/sym, Rotation Matrix
% 
% 
% See also: rotzr, rotzr
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
    theta{mustBeScalarOrEmpty,mustBeA(theta,["numeric","sym"])} = sym('theta','real')
end

    R = [   cos(theta)  -sin(theta)  0;
            sin(theta)  cos(theta)   0;
                0           0        1];
    
end
