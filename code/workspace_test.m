n=7;
%eePosition=[0.2; -0.2; 0.0139];
eePosition=[0.4; -0.2; 0.02];
%initialGuess=;

dukerobot = importrobot('robot7dof.urdf');

% Add coordinate frame for the end effector
eeOffset = 0.13;
eeBody = robotics.RigidBody('end_effector');
tform=[1 0 0 eeOffset;0 0 1 0; 0 -1 0 0; 0 0 0 1];
setFixedTransform(eeBody.Joint,tform);
addBody(dukerobot,eeBody,'link7');

homeConfig = dukerobot.homeConfiguration;
%homeConfig(1).JointPosition = 1.438e-15;
%homeConfig(2).JointPosition = -1.209e-6;
%homeConfig(3).JointPosition = -5.541e-15;
%homeConfig(4).JointPosition = -43788e-7;
%homeConfig(5).JointPosition = 5.843e-14;
%homeConfig(6).JointPosition = -2.851e-9;
%homeConfig(7).JointPosition = -5.168e-15;
%homeConfig(8).JointPosition = 1.459e-16;
%homeConfig(9).JointPosition = -1.459e-16;
show(dukerobot);

gik = robotics.GeneralizedInverseKinematics;
gik.RigidBodyTree = dukerobot;
gik.ConstraintInputs = {'pose','cartesian','joint'};

PoseTarget = robotics.PoseTarget('end_effector');
PoseTarget.TargetTransform = [1 0 0 eePosition(1); 0 1 0 eePosition(2); 0 0 1 eePosition(3); 0 0 0 1];
PoseTarget.OrientationTolerance = pi/36; % 10 degree
PoseTarget.PositionTolerance = 0.005;
PoseTarget.Weights = [1 1];

HeightAboveTable = robotics.CartesianBounds('end_effector');
HeightAboveTable.Bounds = [ -inf, inf;
                            -inf, inf;
                               0, inf];

jointBound = robotics.JointPositionBounds(dukerobot);
jointBound.Bounds = [-pi/3      pi/3;
                      0         pi*2/3;
                     -pi/3      pi/3;
                      0         pi*2/3;
                     -pi/3      pi/3;
                     -pi*2/3	pi*2/3;
                     -pi/3      pi/3;
                     -0.01     0.01;
                     -0.01     0.01];
                   
%[q,info] = gik(previousStates,positionTarget,aimingConstraint,HeightAboveTable,jointBound);
[q,info] = gik(homeConfig,PoseTarget,HeightAboveTable,jointBound);
show(dukerobot,q);