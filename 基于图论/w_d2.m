function x_=w_d2(normdis)
R =400;
r=0.01;
e=0.6;  

% x_ =(normdis^(4));

if(normdis>R||normdis<=r)
    x_=0;
else
    x_=e^((normdis-r)/(R-r))*((log(e))/(R-r))^2;
end
end