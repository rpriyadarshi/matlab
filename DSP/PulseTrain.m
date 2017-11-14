%pulse train signal to be analyzed
fy = 1;                         %signal frequency in Hz
wy = 2*pi*fy;                   %signal frequency in rad/s
Ty = 1/fy;                      %signal period in seconds
N = 256;
fs = N*fy;                      %sampling frequency in Hz
tiv = 1/fs;                     %time interval between samples;
t = 0:tiv:((3*Ty)-tiv);         %time intervals set (3 periods)
W = 20;

%signal first part:
y1 = zeros(256, 1); 
y1(1:W) = 1; 
y1((256-W):256) = 1;
yt = cat(1, y1, y1, y1);        %signal to be plotted
plot(t, yt, 'k');
xlabel('seconds'); 
title('pulse train signal (3 periods)');
