function [X,Y,Z] = combineSection(S) 

    arguments (Repeating)
        S (4,:) double
    end

    X = []; Y = []; Z = [];
    for i=1:nargin
        X = cat(1,X,S{i}(1,:));
        Y = cat(1,Y,S{i}(2,:));
        Z = cat(1,Z,S{i}(3,:));
    end
end
