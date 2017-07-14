function dis=getdisW(ai,aj)
global R;
global r;
global e;

% R=100;
% r=0.01;
% e=0.6;

if(norm(ai-aj)>R)
    dis=0;
elseif(norm(ai-aj)<=r)
    dis=1;
else
    dis=e^((norm(ai-aj)-r)/(R-r));
end


end