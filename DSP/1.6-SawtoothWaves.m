% Sawtooth signals
fy = 100;                   % Signal frequency in Hz
wy = 2 * pi * fy;           % Signal frequency in rad/s
duy = 0.03;                 % Signal duration in seconds
fs = 20000;                 % Sampling frequency in Hz
tiv = 1/fs;                 % Time interval between samples
t = 0:tiv:(duy-tiv);        % Time interval set

y = sawtooth(wy * t, 0.1);  % Signal data set (width 0.1)
subplot(2, 2, 1);
plot(t, y, 'k');            % Plots figure
axis([0 duy -1.5 1.5]);
xlabel('Seconds');
title('Sawtooth Wave');

y = sawtooth(wy * t, 0.3);  % Signal data set (width 0.3)
subplot(2, 2, 2);
plot(t, y, 'k');            % Plots figure
axis([0 duy -1.5 1.5]);
xlabel('Seconds');
title('Sawtooth Wave');

y = sawtooth(wy * t, 0.5);  % Signal data set (width 0.5)
subplot(2, 2, 3);
plot(t, y, 'k');            % Plots figure
axis([0 duy -1.5 1.5]);
xlabel('Seconds');
title('Sawtooth Wave');

y = sawtooth(wy * t, 0.9);  % Signal data set (width 0.9)
subplot(2, 2, 4);
plot(t, y, 'k');            % Plots figure
axis([0 duy -1.5 1.5]);
xlabel('Seconds');
title('Sawtooth Wave');
