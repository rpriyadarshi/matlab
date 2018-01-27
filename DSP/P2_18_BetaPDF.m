% beta PDF
v=0:0.01:1;                     %values set
alpha=5; beta=3;                %random variable parameters
ypdf=betapdf(v,alpha,beta);     %beta PDF
plot(v,ypdf,'k');               %plots figure
axis([0 1 0 2.5]);
xlabel('values'); 
title('beta PDF');