function [T] = tform(R,t)
% Brief: Createe an Homogenous Matrix
% Details:
%    Create an Homogenous Matrix using the rotation matrix R and the
%    translation vector t
% 
% Syntax:  
%     [T] = tform(rotation,translation)
% 
% Inputs:
%    R - (3,3,:), Rotation Matrix
%    t - (3,1,:) or (1,3,:) Elements, Translation Vector
% 
% Outputs:
%    T - (3,3,:) , Homogenous Matrix
% 
% See also: tdecomp

% Author:                          Michele Di Lecce
% Email:                           elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
% Created:                         06-Oct-2022 00:03:25
% Version history revision notes:
%                                  None
% Implementation In Matlab R2022b
% Copyright © 2022 Storm Lab UK, University of Leeds.All Rights Reserved.
%

arguments
    R (3,3,:) {mustBeA(R,["numeric","sym"])} = eye(3)
    t {mustBeA(t,["numeric","sym"])} = ones(3,1)
end
    
    if size(t,1)>1
        T = cat(2,R,t);
        T = cat(1,T,repmat([0 0 0 1],1,1,size(T,3)));
    else
        T = cat(1,R,t);
        T = cat(2,T,repmat([0 0 0 1]',1,1,size(T,3)));
    end
    
end

            