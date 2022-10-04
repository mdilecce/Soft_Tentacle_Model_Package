function [R] = rotzd(alpha)
%ROTZD Rotation matrix z-axis with alpha in degrees.
%   Return the rotation matrix over the z axis for angle alpha(in degrees).  
%   Alpha is measured counter-clockwise in the x-y plane.

    R = [   cosd(alpha)  -sind(alpha)  0;
            sind(alpha)  cosd(alpha)   0;
                0           0        1];
    
end

