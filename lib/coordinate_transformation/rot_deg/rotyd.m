function [R] = rotyd(phi)
% Brief: rotation matrix over the x axis
% Details:
%   Return the rotation matrix over the x axis for angle phi(in degrees).  
%   phi is measured counter-clockwise in the z-x plane.
% 
% Syntax:  
%     [R] = rotyd(phi)
% 
% Inputs:
%    phi - scalar,numeric/sym,D Angle Rotation of the X axis
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
    phi{mustBeScalarOrEmpty,mustBeA(phi,["numeric","sym"])} = sym('phi')
end

    R = [   cosd(phi)   0   sind(phi);
                0       1      0;
            -sind(phi)  0   cosd(phi)];
    
end