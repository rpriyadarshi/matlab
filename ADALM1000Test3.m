clear;
clc;

% Setup variables
Fs = 1000;                    % Sampling frequency
T = 1/Fs;                     % Sampling period
L = 1000;                     % Length of signal
t = (0:L-1)*T;                % Time vector
n = 2^nextpow2(L);
dim = 2;

[f1, f2] = InitDisplay();
s = InitDAC();
V = CreateWaveform(t);
X = Acquire(s, V);
P1 = CalcFFT(n, dim, X);
UpdateDisplay(f1, f2, Fs, t, n, X, P1);

clear s;

% ADALM1000
function s = InitDAC()
    d = daq.getDevices;
    s = daq.createSession('adi');

    addAnalogOutputChannel(s,'smu1','a','Voltage');
    addAnalogInputChannel(s,'smu1','b','Voltage');
end

function w = CreateWaveform(t)
    a = randperm(300,1);
    a1 = a / 3;
    a2 = 2 * a / 3;
    a3 = a;

    w1 = cos(2*pi*a1*t);         % First row wave
    w2 = cos(2*pi*a2*t);         % Second row wave
    w3 = cos(2*pi*a3*t);         % Third row wave
    w4 = w1 + w2 + w3;

    % Shift the values to positive.
    w = w4 - min(w4);
end

function X = Acquire(s, V)
    queueOutputData(s, V');
    X = startForeground(s)'; 
end

function P1 = CalcFFT(n, dim, X)
    Y = fft(X, n, dim);

    P2 = abs(Y/n);
    P1 = P2(:,1:n/2+1);
    P1(:,2:end-1) = 2*P1(:,2:end-1);
end

function [f1, f2] = InitDisplay()
    subplot(2,1,1);
    f1 = plot(0, 0);
    title(['Row ',num2str(1),' in the Time Domain (Acquired)']);

    subplot(2,1,2);
    f2 = plot(0, 0);
    title(['Row ',num2str(1), ' in the Frequency Domain (Acquired)']);
end

function UpdateDisplay(f1, f2, Fs, t, n, X, P1)
    set(f1, 'XData', t(1:100), 'YData', X(1,1:100));
    set(f2, 'XData', 0:(Fs/n):(Fs/2-Fs/n), 'YData', P1(1,1:n/2));
end