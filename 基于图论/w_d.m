function x_=w_d(normdis)
global R;
global r;
global e;

if(normdis>R||normdis<=r)
    x_=0;
else
    x_=e^((normdis-r)/(R-r))*(log(e))/(R-r);
end
end