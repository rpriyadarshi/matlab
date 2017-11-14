% Sum of sines signal
fy = 300;               % Signal frequency in Hz
wy = 2 * pi * fy;       % Signal frequency in rad/s
fs = 6000;              % Sampling frequency in Hz
tiv = 1 / fs;           % Time interval between samples
t = 0:tiv:(5-tiv);      % Time intervals set (5 seconds)

% Signal data set:
y = 0.64 * sin(wy * t) + 0.3 * sin(3 * wy * t) + 0.12 * sin(5 * wy * t);
sound(y, fs);           % Sound
t = 0:tiv:(0.01-tiv);   % Time intervals set (0.01 seconds)

% Signal data set:
y = 0.6 * sin(wy * t) + 0.3 * sin(3 * wy * t) + 0.2 * sin(5 * wy * t);
plot(t, y, 'k');        % Plots figure
axis([0 0.01 -1.5 1.5]);
xlabel('Seconds');
title('Sum of sines signal');
