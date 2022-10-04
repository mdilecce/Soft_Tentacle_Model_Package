function [R] = rotxd(gamma)
%ROTZD Rotation matrix x-axis with gamma in degrees.
%   Return the rotation matrix over the x axis for angle gamma(in degrees).  
%   Gamma is measured counter-clockwise in the y-z plane.

    R = [   1       0           0;
            0   cosd(gamma)  -sind(gamma);
            0   sind(gamma)  cosd(gamma)];
    
end