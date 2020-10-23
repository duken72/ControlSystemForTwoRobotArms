%% Robot arm control parameters
addpath(genpath(pwd)); %generate neccesary path for seeking files
eeTolerance= 0.01; %end effector error tolerance
angleTolerance=2; %angle error tolerance
n=7; %number of degree of freedom
%% Trajectory
trajectory = [0.4  0.4  0.4  0.4  0.4  0.4  0.4;
              0    0    0    0    0    0    0;
             -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2;
              0    5    10   15   10   5    0];
dukerobotR = importrobot('2robot7dofRightArm.urdf');
dukerobotL = importrobot('2robot7dofLeftArm.urdf');
%Standard Boundaries
JointBounds0 = [-pi/2       pi;
                -pi/2       pi/2;
                -2*pi/3     2*pi/3;
                -2*pi/3     2*pi/3;
                -2*pi/3     2*pi/3;
                -pi*5/6     pi*5/6;
                -2*pi/3     2*pi/3];
%Special Boundaries for Grabbing Pose
JointBounds1 = [-pi/2       pi;
                -pi/36      pi/36;
                 pi/2       pi/2;
                 pi/3       2*pi/3;
                -pi/2      -pi/2;
                -pi/2      -pi/2;
                 pi/2       pi/2];
%Special Boundaries for Rotation Pose
JointBounds2 = [-pi/3       pi/3;
                -pi/6       pi/6;
                 pi/6       2*pi/3;
                 pi/3       3*pi/4;
                -2*pi/3    -pi/6;
                -pi*5/6     pi*5/6;
                -2*pi/3     2*pi/3];
             
rotM0 = eye(3);
rotM1 = roty(90)*rotx(90); %Grab Object, point toward -z-axis
rotM2 = rotx(90); %Grab Object, point toward x-axis