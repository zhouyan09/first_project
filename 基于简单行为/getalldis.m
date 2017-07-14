function DIS = getalldis(x)

[M,N] = size(x);
DIS = zeros(M,M);
for i = 1:M
    for j= i+1 : M
        DIS(i,j) = norm(x(i,:)-x(j,:));
        DIS(j,i) = DIS(i,j);
    end
end

end

