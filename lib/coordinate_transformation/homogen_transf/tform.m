function [T] = tform(rotation,translation)
% Brief: Createe an Homogenous Matrix
% Details:
%    None
% 
% Syntax:  
%     [T] = tform(rotation,translation)
% 
% Inputs:
%    rotation - (3,3,:), Rotation Matrix
%    translation - (3,1,:) or (1,3,:) Elements, Translation Vector
% 
% Outputs:
%    T - (3,3,:) , Homogenous Matrix
% 
% See also: tdecomp
%
% Author:                          Michele Di Lecce
% Email:                           elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
% Created:                         06-Oct-2022 00:03:25
% Version history revision notes:
%                                  None
% Implementation In Matlab R2022b
% Copyright © 2022 Storm Lab UK, University of Leeds.All Rights Reserved.
%

arguments
    rotation (3,3,:) {mustBeA(rotation,["numeric","sym"])} = eye(3)
    translation {mustBeA(translation,["numeric","sym"])} = ones(3,1)
end
    
    if size(translation,1)>1
        T = cat(2,rotation,translation);
        T = cat(1,T,repmat([0 0 0 1],1,1,size(T,3)));
    else
        T = cat(1,rotation,translation);
        T = cat(2,T,repmat([0 0 0 1]',1,1,size(T,3)));
    end
    
end

            