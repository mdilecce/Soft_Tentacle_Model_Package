function [S]=skew(v)
% Brief: Skew Matrix
% Details:
%    Return the Skew Matrix for a vector 3x1
% 
% Syntax:  
%     [S]=skew(v)
% 
% Inputs:
%    v - [3,1], numeric/sym, Vector
% 
% Outputs:
%    S - [3,3], numeric/sym, Skew
% 

% Author:                          Michele Di Lecce
% Email:                           elmdl@leeds.ac.uk, michele.dilecce@hotmail.com
% Created:                         06-Oct-2022 01:21:32
% Version history revision notes:
%                                  None
% Implementation In Matlab R2022b
% Copyright © 2022 Storm Lab UK, University of Leeds.All Rights Reserved.
%
arguments
    v (3,1) {mustBeA(v,["numeric","sym"])} = sym('v',[3,1],'real')
end

S = [0 -v(3) v(2); 
    v(3) 0 -v(1);
    -v(2) v(1) 0];

end