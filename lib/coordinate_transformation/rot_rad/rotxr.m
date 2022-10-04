function [R] = rotxr(gamma)
%ROTZR Rotation matrix x-axis with gamma in radiants.
%   Return the rotation matrix over the x axis for angle gamma(in radiants).  
%   Gamma is measured counter-clockwise in the y-z plane.

    R = [   1       0           0;
            0   cos(gamma)  -sin(gamma);
            0   sin(gamma)  cos(gamma)];
    
end

