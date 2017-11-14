% Gamma function
v=0.1:0.01:1;
ygam=gamma(v);
plot(v,ygam,'k'); hold on;
xlabel('values'); 
title('gamma function');