function jointStatesR = IKR(eePositionR,initialGuessR,rotM,JointBounds)

persistent dukerobotR
persistent previousStatesR
persistent gikR

n=7;

if(isempty(dukerobotR))
    [dukerobotR,previousStatesR] = cRBTR();
    gikR = robotics.GeneralizedInverseKinematics;
    gikR.RigidBodyTree = dukerobotR;
    gikR.ConstraintInputs = {'pose','joint'};
    %gikR.SolverAlgorithm = LevenbergMarquardt;
end

% Populate the previous configuration structure with the input data from simulation
for idx = 1:n
	previousStatesR(idx).JointPosition = initialGuessR(idx);
end

PoseTargetR = robotics.PoseTarget('end_effectorR');
PoseTargetR.TargetTransform = [rotM, eePositionR; 0 0 0 1];
%PoseTargetR.OrientationTolerance = pi/180; % 1 degree
%PoseTargetR.PositionTolerance = 0.001;
%PoseTargetR.Weights = [1 1];

jointBoundR = robotics.JointPositionBounds(dukerobotR);
jointBoundR.Bounds = JointBounds;

%[q,info] = gik(previousStates,positionTarget,aimingConstraint,HeightAboveTable,jointBound);
[q,info] = gikR(previousStatesR,PoseTargetR,jointBoundR);

% Assign to the output variable from the robot configuration structure
for idx = 1:n
	jointStatesR(idx) = q(idx).JointPosition;
end

end