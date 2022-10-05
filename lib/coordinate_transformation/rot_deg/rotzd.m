function [R] = rotzd(theta)
% Brief: rotation matrix over the x axis
% Details:
%   Return the rotation matrix over the x axis for angle theta(in degrees).  
%   theta is measured counter-clockwise in the z-x plane.
% 
% Syntax:  
%     [R] = rotzd(theta)
% 
% Inputs:
%    theta - scalar,numeric/sym,D Angle Rotation of the X axis
% 
% Outputs:
%    R - [3,3], numeric/sym, Rotation Matrix
% 
% 
% See also: rotzd, rotzd
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
    theta{mustBeScalarOrEmpty,mustBeA(theta,["numeric","sym"])} = sym('theta')
end

    R = [   cosd(theta)  -sind(theta)  0;
            sind(theta)  cosd(theta)   0;
                0           0        1];
    
end
