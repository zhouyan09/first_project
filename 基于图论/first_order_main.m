%first_order_main
clear all;
close all
global R;
global r;
global e;
R=200;
r=0.01;
e=0.6;
% close all;

 time = 0.25;
 count=0;
 N=20;
 dimen=2;%X 与Y两个维度
 x=R*rand(N,dimen);
 endtime=1000;
 
 re=zeros(N,dimen,endtime/time+1);
 ure=zeros(N,dimen,endtime/time+1);
 U=zeros(N,dimen);
omiga = 0;

global h;
global v;
 h=zeros(N,dimen);
 v=zeros(N,dimen);

 


 
 
 
 for kk=0:time:endtime
 
 %A=[x1;x2;x3];%N行
 for i=1:N

 h(i,:)=10*[sin(i/N*(2*pi)+omiga*kk),cos((i/N*(2*pi)))+omiga*kk];
% v(i,:)=[omiga*cos(i/N*(2*pi)+omiga*kk),-omiga*sin((i/N*(2*pi)+omiga*kk))];
% h(i,:)=[2*i,2*i];
 
 end
 A=x;
 
 %%得到拉式矩阵
 L=GetLaplace_t(A,kk);
 

 %%对于特征值2计算
 [V,D] = eig(L);%%暂时这样特征值是从小到大排序，但是感觉不可以长久，
 %得写出专门的函数让其从小到大排序，包括特征向量
 v2=V(:,2);
 rlamada(count+1)= D(2,2);
 lamd_x =zeros(N,dimen);

 for i=1:N

%    h(i,:)=[2*i,2*i];
%     v(i,:)=[cos(i/N*(2*pi)+0*kk),-sin((i/N*(2*pi)+0*kk))];
%     h(i,:)=[0,0];
%      v(i,:)=[0,0];
 end
 for i=1:N
     temp=zeros(1,dimen);
    	
     for j=1:N
         if(j==i)continue;
         else
             temp1=[];
             temp1 = v2(i)*(v2(i)-2*v2(j))*w_d(norm(A(i,:)-h(i,:)-A(j,:)+h(j,:)))*(A(i,:)-h(i,:)-A(j,:)+h(j,:))/(norm(A(i,:)-h(i,:)-A(j,:)+h(j,:)));
        
        if(kk==25)
        tt=1;
        
        end

                 temp= temp+ temp1;
         end
     end
     
     
     lamd_x(i,:)=temp;
     
     if(kk>30)
         OK=1;
     end
         
     
     if(norm(lamd_x(i,:))>0)
        U(i,:)=lamd_x(i,:)/norm(lamd_x(i,:));  
     else
         U(i,:)=lamd_x(i,:);
     end
     
      U(i,:) =  U(i,:)+ v(i,:);
%     
     
%     U(i,:) =   U(i,:)+1*(h(i,:)-x(i,:));
     
 end
 %%
 
 for k=1:N
     for l=1:dimen
         x(k,l)= x(k,l)+time * U(k,l);
%          x(k,l)= x(k,l)+h(k,l);
     end
 end
 count = count +1;
 ure(:,:,count)=U;
 re(:,:,count)=x;

 end
 
 %%
 [m,n,len]=size(re);
 %%
 figure;
 tx=[];
 ty=[];
 color=['r','k','b','g','y'];
 for k=1:N
     hold on;
     tx=squeeze(re(k,1,:));
     ty=squeeze(re(k,2,:));
     plot(tx,ty,color(mod(k,5)+1));
        
     plot(re(k,1,len),re(k,2,len),strcat(color(mod(k,5)+1),'*'),'MarkerSize',15);
%      if(k<N)
%      plot([re(k,1,len),re(k+1,1,len)],[re(k,2,len),re(k+1,2,len)],color(k));
%      end
%      
%      if(k==N)
%          
%      plot([re(k,1,len),re(1,1,len)],[re(k,2,len),re(1,2,len)],'b-');
%      end  

 end
    
 %%
 figure;
 hold on;
 for i=1:N
      hold on;
      if(i<N)
     plot([re(i,1,len),re(i+1,1,len)],[re(i,2,len),re(i+1,2,len)],color(mod(i,5)+1));
     end
     
     if(i==N)
     plot([re(i,1,len),re(1,1,len)],[re(i,2,len),re(1,2,len)],'b-');
     end
 end
%  hold on;
%  plot(sin())
 %%
  t=[0:time:endtime];
  
 %%
  figure;
  hold on;
  for i=1:N
 plot(t,squeeze(re(i,2,:)));
  end
 %%
%  figure;
%  plot(t,squeeze(ure(1,1,:)));
%  
 %%
% 
%  figure;
%  plot(t,squeeze(re(1,1,:)));
 
%  figure;plot(rex1(:,1),rex1(:,2),'b');
%  hold on;
%  plot(rex2(:,1),rex2(:,2),'r');
%  hold on;
%  plot(rex3(:,1),rex3(:,2),'g');