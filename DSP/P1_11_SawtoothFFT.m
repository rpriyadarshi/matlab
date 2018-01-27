% Fourier Transform of sawtooth signal
fy = 1;                 % signal frequency in Hz
wy = 2*pi*fy;           % signal frequency in rad/s
Ty = 1/fy;              % signal period in seconds
N = 256;
fs = N*fy;              % sampling frequency in Hz
tiv = 1/fs;             % time interval between samples;
t = 0:tiv:(Ty-tiv);     % time intervals set
y = sawtooth(wy*t);     % signal data set

fou = fft(y, fs);       % Fourier Transform (set of complex numbers)
hmag = imag(fou);
bh = hmag/N;            % get set of harmonic amplitudes
stem(0:9, bh(1:10));    % plot of first 10 harmonics
axis([0 10 0 1]);
xlabel('Hz');
title('sawtooth signal harmonics');
