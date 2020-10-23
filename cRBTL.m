function [dukerobotL,homeConfigL] = cRBTL
% Create Rigid Body Tree LEFT ARM
% Import the robot description from the URDF file
dukerobotL = importrobot('2robot7dofLeftArm.urdf');

% Add coordinate frame for the end effector
eeOffset = 0.16;
eeBodyL = robotics.RigidBody('end_effectorL');
tform=[1 0 0 eeOffset;0 0 1 0; 0 -1 0 0; 0 0 0 1];
setFixedTransform(eeBodyL.Joint,tform);
addBody(dukerobotL,eeBodyL,'link7');
homeConfigL = dukerobotL.homeConfiguration;
%show(dukerobotL);
%show(dukerobotL,q);
end