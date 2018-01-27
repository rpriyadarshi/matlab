% Normal PDF
v=-3:0.01:3;                %values set
mu=0; sigma=1;              %random variable parameters
ypdf=normpdf(v,mu,sigma);   %normal PDF
plot(v,ypdf,'k'); 
hold on;                    %plots figure
axis([-3 3 0 0.5]);
xlabel('values'); 
title('normal PDF');