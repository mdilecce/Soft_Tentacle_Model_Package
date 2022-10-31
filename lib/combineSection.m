function [X,Y,Z] = combineSection(varargin) 
    X = [];
    Y = [];
    Z = [];
    for i=1:nargin
        %CheckSize
        S = varargin{i};
        X = cat(1,X,S(1,:));
        Y = cat(1,Y,S(2,:));
        Z = cat(1,Z,S(3,:));
    end
end