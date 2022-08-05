%%  Script for the calculation of the relative distance between two objects in a 3-dimensional plane
%   Uses one CSV file without headers as input.
%   This script was written in order to use data from two objects
%   simulated in GMAT
%   Based on the sqrt((x2-x1)^2+*(y2-y1)^2+(z2-z1)^2)) expression
%   By: José María Jiménez Coronado
%%

%   Cleans terminal and workspace
clear;
clc;

%       Data import
doc = csvread('positionData.txt');

%-----------  DATA FORMAT   -------------%
%   | TIME | X1 | Y1 | Z1 | X2 | Y2 | Z2 |
%----------------------------------------%
%            Structure stablishment
%----------------------------------------%
N = length(doc);        %   Saves the size of the array
dist = zeros(1,N);      %   Preallocating the structure
time = doc(:,1);        %   Time vector for plotting
%------------------------------------------------------------%
%            Distance calculation cycle
%------------------------------------------------------------%
for i=1:N
    dist(i) = sqrt((doc(i,5)-doc(i,2))*(doc(i,5)-doc(i,2))+(doc(i,6)-doc(i,3))*(doc(i,6)-doc(i,3))+(doc(i,7)-doc(i,4))*(doc(i,7)-doc(i,4)));
end
%------------------------------------------------------------%
%   Plotting
%------------------------------------------------------------%
figure;
grid on;
title('Intersatellite distance');
xlabel('Time [days]');
ylabel('Distance [km]');
hold on;
plot(time, dist);
disp('Minimum distance [km]: ');
disp(min(dist));