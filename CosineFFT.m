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

% Shift the values to positive.
v1 = v1 + 1;
v2 = v2 + 1;
v3 = v3 + 1;

queueOutputData(s, v1');
x1 = startForeground(s); 
queueOutputData(s, v2');
x2 = startForeground(s); 
queueOutputData(s, v3');
x3 = startForeground(s); 

X = [x1'; x2'; x3'];

Y = fft(X, n, dim);

P2 = abs(Y/n);
P1 = P2(:,1:n/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);

figure(1);
for i = 1:3
    subplot(3,1,i)
    plot(t(1:100),X(i,1:100))
    title(['Row ',num2str(i),' in the Time Domain (Acquired)'])
end

figure(2);
for i=1:3
    subplot(3,1,i)
    plot(0:(Fs/n):(Fs/2-Fs/n),P1(i,1:n/2))
    title(['Row ',num2str(i), ' in the Frequency Domain (Acquired)'])
end

clear s;
