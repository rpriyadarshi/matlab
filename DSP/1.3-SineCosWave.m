% Sine and cosine waveforms
fy = 1;             % Signal frequency in Hz
wy = 2 * pi * fy;   % Signal frequency in rad/s
fs = 60;            % Sampling frequency in Hz
tiv = 1 / fs;       % Time interval between samples
t = 0:tiv:(3-tiv);  % Time interval set
ys = sin(wy * t);   % Signal data set
yc = cos(wy * t);   % Signal data set

plot(t, ys, 'k');   % Plots figure
hold on;
axis([0 3 -1.5 1.5]);
xlabel('Seconds');
plot(t, yc, '--k'); % Plots figure
axis ([0 3 -1.5 1.5]);
xlabel('seconds');
title('Sine (solid) and Cosine (dashed)');