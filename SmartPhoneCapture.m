%This is a script that will plot Arduino analogRead values in real time
%Modified from http://billwaa.wordpress.com/2013/07/10/matlab-real-time-serial-data-logger/
%The code from that site takes data from Serial
%http://www.mathworks.com/access/helpdesk/help/techdoc/matlab_external/bp_kqh7.html
%http://docs.psychtoolbox.org/Daq
clear
clc

connector('on','password','Magic17');
m = mobiledev;
m.AccelerationSensorEnabled = 1;
m.Logging = 1;

%User Defined Properties 
plotTitle = 'Data Log';      	% plot title
xLabel = 'Elapsed Time (s)';        % x-axis label
yLabel = 'Acceleration';            % y-axis label
legendx = 'Acceleration(x)';
legendy = 'Acceleration(y)';
legendz = 'Acceleration(z)';

yMax  = 20;                         %y Maximum Value
yMin  = -20;                        %y minimum Value

plotGrid = 'on';                    % 'off' to turn off grid
max = yMax;                       	% set y-max
min = yMin;                         % set y-min
delay = .01;                        % make sure sample faster than resolution 

%Define Function Variables
t = 0;
X = 0;
Y = 0;
Z = 0;
n = 0;

%Set up Plot
gx = plot(t, X,'-r' );              % every AnalogRead needs to be on its own Plotgraph
hold on;                            % hold on makes sure all of the channels are plotted
gy = plot(t, Y,'-b');
gz = plot(t, Z,'-g');

title(plotTitle, 'FontSize', 15);
xlabel(xLabel, 'FontSize', 15);
ylabel(yLabel, 'FontSize',15);
legend(legendx, legendy, legendz)
axis([yMin yMax min max]);
grid(plotGrid);

tic

W = 10;
t = zeros(1, W);
X = zeros(1, W);
Y = zeros(1, W);
Z = zeros(1, W);

while ishandle(gx)                  % Loop when Plot is Active will run until plot is closed
    x = m.Acceleration(1);          % Data from Smart Phone
    y = m.Acceleration(2); 
    z = m.Acceleration(3);
    
    n = n + 1;    
    t(n) = toc;    
    X(n) = x;         
    Y(n) = y;
    Z(n) = z;
    
    %This is the magic code 
    %Using plot will slow down the sampling time.. At times to over 20
    %seconds per sample!
    set(gx, 'XData', t, 'YData', X);
    set(gy, 'XData', t, 'YData', Y);
    set(gz, 'XData', t, 'YData', Z);
    
    xMin = 0;
    xMax = t(n);
    if (n > W)
        xMin = t(n - W);
    end
    axis([xMin xMax min max]);
    
    %Update the graph
    pause(delay);
end

m.AccelerationSensorEnabled = 0;
m.Logging = 0;
delete(m);
connector off;

disp('Plot Closed and mobiledev object has been deleted');
