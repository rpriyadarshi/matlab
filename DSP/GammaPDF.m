% Gamma-type PDFs
v=0:0.01:10;                    %values set
alpha=1; beta=1;                %random variable parameters
ypdf=gampdf(v,alpha,beta);      %gamma-type PDF
plot(v,ypdf,'k'); hold on;      %plots figure
axis([0 10 0 1.2]);
alpha=2; beta=1;                %random variable parameters
ypdf=gampdf(v,alpha,beta);      %gamma-type PDF
plot(v,ypdf,'--k'); hold on;    %plots figure
alpha=4; beta=1;                %random variable parameters
ypdf=gampdf(v,alpha,beta);      %gamma-type PDF
plot(v,ypdf,':k'); 
hold on;                        %plots figure
xlabel('values'); 
title('gamma-type PDFs');
