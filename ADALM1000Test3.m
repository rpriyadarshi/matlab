clear;
clc;

% ADALM1000
d = daq.getDevices;
s = daq.createSession('adi');

addAnalogOutputChannel(s,'smu1','a','Voltage');
addAnalogInputChannel(s,'smu1','b','Voltage');

% Waveform setup
Fs = 1000;                    % Sampling frequency
T = 1/Fs;                     % Sampling period
L = 1000;                     % Length of signal
t = (0:L-1)*T;                % Time vector
n = 2^nextpow2(L);
dim = 2;

v1 = cos(2*pi*50*t);          % First row wave
v2 = cos(2*pi*150*t);         % Second row wave
v3 = cos(2*pi*300*t);         % Third row wave
v4 = v1 + v2 + v3;

% Shift the values to positive.
V = v4 - min(v4);

queueOutputData(s, V');
X = startForeground(s)'; 

Y = fft(X, n, dim);

P2 = abs(Y/n);
P1 = P2(:,1:n/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);

subplot(2,1,1)
plot(t(1:100),X(1,1:100))
title(['Row ',num2str(1),' in the Time Domain (Acquired)'])

subplot(2,1,2)
plot(0:(Fs/n):(Fs/2-Fs/n),P1(1,1:n/2))
title(['Row ',num2str(1), ' in the Frequency Domain (Acquired)'])

clear s;
