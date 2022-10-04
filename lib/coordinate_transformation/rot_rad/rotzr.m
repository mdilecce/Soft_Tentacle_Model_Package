function [R] = rotzr(alpha)
%ROTZR Rotation matrix z-axis with alpha in radiants.
%   Return the rotation matrix over the z axis for angle alpha(in radiants).  
%   Alpha is measured counter-clockwise in the x-y plane.

    R = [   cos(alpha)  -sin(alpha)  0;
            sin(alpha)  cos(alpha)   0;
                0           0        1];
    
end

