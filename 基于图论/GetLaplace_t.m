function L=GetLaplace_t(A,t)

[N,dim]=size(A);
Aself=zeros(N,N);
L=zeros(N,N);
pos=zeros(N,dim);
global h;
global v;
pos=h;
% for i=1:N
% %     pos(i,:)=[sin(i/N*(2*pi)+0*t),cos(i/N*(2*pi)+0*t)];
% % pos(i,:)=[0,0];
% pos(i)=0;
% end
for i=1:N
        
        sum =0 ;%用于记录这一行的和，用于计算拉视距真
    for j=1:N
        
         if(j==i) continue;
         else
            Aself(i,j)=getdisW(A(i,:)-pos(i),A(j,:)-pos(j));
            sum = sum+Aself(i,j);
         end
    end
    L(i,i)=sum;
    
end
    L = L-Aself;
end