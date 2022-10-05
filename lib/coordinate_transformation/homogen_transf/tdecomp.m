function [ROTATION,TRANSLATION] = tdecomp(T)
%TFORM 
%[ROTATION,TRANSLATION] = TFORM(T)
% Brief: Decompose an Homogenous Matrix
% Details:
%   Return Rotation Matrix and Translation Matrix from an 
%   homegenous transformation matrix
% 
% Syntax:  
%     [ROTATION,TRANSLATION] = tdecomp(T)
% 
% Inputs:
%    T - [4,4,M], Homogenous Matrix
% 
% Outputs:
%    ROTATION - [3,3,M],Rotation Matrix
%    TRANSLATION - [1,3,M], Translation Vector
% 
% 
% See also: tform

% Author:                          Michele Di Lecce
% Email:                           elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
% Created:                         05-Oct-2022 20:51:28
% Version history revision notes:
%                                  None
% Implementation In Matlab R2022b
% Copyright © 2022 Storm Lab UK, University of Leeds.All Rights Reserved.
%

arguments
    T (4,4,:) {mustBeA(T,["numeric","sym"])} = eye(4);
end

    ROTATION = T(1:3,1:3,:);
    
    if isequal(round(max(T(4,1:3,:)*1e10)*1e-10,zeros(1,3))   
        TRANSLATION = T(1:3,4,:);
    else
        TRANSLATION = T(4,1:3,:);
    end


end 