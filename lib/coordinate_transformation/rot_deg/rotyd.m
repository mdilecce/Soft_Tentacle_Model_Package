function [R] = rotyd(beta)
%ROTYD Rotation matrix y-axis with beta in degrees.
%   Return the rotation matrix over the y axis for angle beta(in degrees).  
%   Beta is measured counter-clockwise in the z-x plane.

    R = [   cosd(beta)   0   sind(beta);
                0       1       0;
            -sind(beta)  0   cosd(beta)];
    
end
