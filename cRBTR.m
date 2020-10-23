function [dukerobotR,homeConfigR] = cRBTR
% Create Rigid Body Tree RIGHT ARM
% Import the robot description from the URDF file
dukerobotR = importrobot('2robot7dofRightArm.urdf');

% Add coordinate frame for the end effector
eeOffset = 0.16;
eeBodyR = robotics.RigidBody('end_effectorR');
tform=[1 0 0 eeOffset;0 0 1 0; 0 -1 0 0; 0 0 0 1];
setFixedTransform(eeBodyR.Joint,tform);
addBody(dukerobotR,eeBodyR,'link7');
homeConfigR = dukerobotR.homeConfiguration;
%show(dukerobotR);
%show(dukerobotR,q);
end