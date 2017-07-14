clear all
clc;
close all;

R=200;
N = 3;
time = 0.25;
count = 0;
 dimen=2;%X 与Y两个维度
 %x=R*rand(N,dimen);
 x(:,1) = R * cos(rand(N,1));
 x(:,2) = R * sin(rand(N,1));
 global safe_dis;
 safe_dis = 2;
 %get the neighbodhoods 
 endtime=1000;
 re=zeros(N,dimen,endtime/time+1);
 ure=zeros(N,dimen,endtime/time+1);
 U=zeros(N,dimen);
 
 for i =0 :time:endtime
      nei = zeros(N,2);
 %store the distance
 DIS = getalldis(x);
 %through the 
 nei = getallneighbors(DIS);
 
 %get all input
Uonce = getallinput(x,nei);
 

x = x + Uonce * 0.1;


 count = count +1;
 re(:,:,count)=x;
  ure(:,:,count)=Uonce;
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
 end
 
 %%
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
 end %%
 
 
 %%
   t=[0:time:endtime];
 %%
 %%output
 figure;
 for k=1:N
     hold on;
     tx=squeeze(ure(k,1,:));
     ty=squeeze(ure(k,2,:));
     plot(t,ty,color(mod(k,5)+1));
        
    % plot(re(k,1,len),re(k,2,len),strcat(color(mod(k,5)+1),'*'),'MarkerSize',15);
 end
 