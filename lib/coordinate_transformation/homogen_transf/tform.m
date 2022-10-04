function [T] = tform(varargin)
%TFORM Create a homegenous transformation matrix
%[T] = TFORM(ROTATION,TRANSLATION)

    p = inputParser;
    addRequired(p,'R', @(x) isnumeric(x));
    addOptional(p,'t',zeros(1,3), @(x) isnumeric(x));
    parse(p, varargin{:});

    rotation = p.Results.R(1:3,1:3,:);
    if size(p.Results.t,1)>1
        translation = p.Results.t(1:3,:,:);
    else
        translation = p.Results.t(:,1:3,:);
    end
    
    if size(translation,1)>1
        T = cat(2,rotation,translation);
        T = cat(1,T,repmat([0 0 0 1],1,1,size(T,3)));
    else
        T = cat(1,rotation,translation);
        T = cat(2,T,repmat([0 0 0 1]',1,1,size(T,3)));
    end
    
end

            