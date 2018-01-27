% Square Wave
A = [1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0];
fs = 10;            % Sampling frequency in Hz
tiv = 1/fs;         % Time interval between samples
t = 0:tiv:(3-tiv);  % Time interval set (30 values)

plot(t, A, '*');    % Plots figure
axis([0 3 -0.5 1.5]);
xlabel('sec.');
title('Square wave samples');
