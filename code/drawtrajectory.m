addpath(genpath(pwd));
%Input data
Tr=matfile('trajR.mat');
TL=matfile('trajL.mat');
tr=Tr.simout;
tl=TL.simout1;
xr=tr.Data(:,1); yr=tr.Data(:,2); zr=tr.Data(:,3);
xl=tl.Data(:,1); yl=tl.Data(:,2); zl=tl.Data(:,3);
%%Refresh and clean figure
clf;

%% Plot trajectory for Right Hand
p1=plot3(xr,yr,zr); p1.Color = 'blue'; p1.LineStyle= '--'; p1.Marker = 'o'; p1.MarkerSize = 0.7;
hold on;
%% Plot trajectory for Left Hand
p2=plot3(xl,yl,zl); p2.Color = 'green'; p2.Marker = '+'; p2.LineStyle= ':'; p2.MarkerSize = 0.7;