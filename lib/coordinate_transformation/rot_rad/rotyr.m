function [R] = rotyr(beta)
%ROTYR Rotation matrix y-axis with beta in radiants.
%   Return the rotation matrix over the y axis for angle beta(in radiants).  
%   Beta is measured counter-clockwise in the z-x plane.

    R = [   cos(beta)   0   sin(beta);
                0       1      0;
            -sin(beta)  0   cos(beta)];
    
end
