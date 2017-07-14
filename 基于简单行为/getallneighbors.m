function  nei = getallneighbors(DIS)

[M,N]=size(DIS);

for i=1:M
min1 = +inf;
min2 = +inf;

for j= 1:M
if(j==i) 
        continue;
    
else
    
       if(min1 > DIS(i,j))
         
            min1 = DIS(i,j);
            nei(i,1) = j;
       end
 
    
        
end

end

for j = 1:M
    if(j==i||j==nei(i,1)) 
        continue;
    
else
          if(min2 > DIS(i,j))

            min2 = DIS(i,j);
            nei(i,2) = j;
            end
           
       end
    
end
end
end