% Sine Wave
fy = 1;                 % Signal frequency in Hz
wy = 2 * pi * fy;       % Signal frequency in radians/sec
fs = 60;                % Sampling frequency in Hz
tiv = 1 / fs;           % Time interval between samples
t = 0:tiv:(3-tiv);      % Time interval set, 180 values
y = sin(wy * t);        % Signal data set

plot(t, y, 'k');        % Plot figure
axis([0 3 -1.5 1.5]);
xlabel('Seconds');
title('Sine Wave');
