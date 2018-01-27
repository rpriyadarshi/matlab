% Sine wave sound
fy = 300;             	% Signal frequency in Hz
wy = 2 * pi * fy;       % Signal frequency in radians/sec
fs = 6000;              % Sampling frequency in Hz
tiv = 1 / fs;           % Time interval between samples
t = 0:tiv:(5-tiv);      % Time interval set (5 seconds)
y = sin(wy * t);        % Signal data set
sound(y, fs);           % Sound

t = 0:tiv:(0.01-tiv);   % Time interval set (0.01 seconds)
y = sin(wy * t);        % Signal data set

plot(t, y, 'k');        % Plot figure
axis([0 0.01 -1.5 1.5]);
xlabel('Seconds');
title('Sine Wave');
