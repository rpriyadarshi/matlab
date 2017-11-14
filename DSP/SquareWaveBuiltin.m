% Square Wave using builtin function
fy = 100;               % Signal frequency in Hz
wy = 2 * pi * fy;       % Signal frequency in rad/s
duy = 0.03;             % Signal duration in seconds
fs = 20000;             % Sampling frequency in Hz
tiv = 1 / fs;           % Time interval between samples
t = 0:tiv:(duy - tiv);  % Time interval set
y = square(wy * t);     % Signal data set
plot(t, y, 'k');        % Plots figure
axis([0 duy -1.5 1.5]);
xlabel('Seconds');
title('Square Wave');