function [ROTATION,TRANSLATION] = tdecomp(T)
%TFORM Return Rotation Matrix and Translation Matrix from an 
% homegenous transformation matrix
%[ROTATION,TRANSLATION] = TFORM(T)


        ROTATION = T(1:3,1:3,:);
        
        if isequal(round(max(T(4,1:3,:)*1e10)*1e-10,zeros(1,3))   
            TRANSLATION = T(1:3,4,:);
        else
            TRANSLATION = T(4,1:3,:);
        end


end 