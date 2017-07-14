function U = getallinput(x,nei)
[M,N] = size(x);


global safe_dis;
for i = 1:M
    
    if(norm(x(nei(i,1))-x(nei(i,2))) > safe_dis )
        
             U(i,:) = getdirection(x(nei(i,1)),x(nei(i,2))) - x(i,:);
    elseif(abs(norm(x(nei(i,1))-x(nei(i,2))) - safe_dis) < 1)
            U(i,:) = [0 0];
    else
    %% 
    %diverse input
        
        
    U(i,:) = -getdirection(x(nei(i,1)),x(nei(i,2))) - x(i,:) * 0.5;
    end
end
    
end

