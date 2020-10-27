function jointStatesL = IKL(eePositionL,initialGuessL,rotM,JointBounds)

persistent dukerobotL
persistent previousStatesL
persistent gikL

n=7;

if(isempty(dukerobotL))
    [dukerobotL,previousStatesL] = cRBTL();
    gikL = robotics.GeneralizedInverseKinematics;
    gikL.RigidBodyTree = dukerobotL;
    gikL.ConstraintInputs = {'pose','joint'};
    %gikL.SolverAlgorithm = LevenbergMarquardt;
end

% Populate the previous configuration structure with the input data from simulation
for idx = 1:n
	previousStatesL(idx).JointPosition = initialGuessL(idx);
end

PoseTargetL = robotics.PoseTarget('end_effectorL');
PoseTargetL.TargetTransform = [rotM, eePositionL; 0 0 0 1];
%PoseTargetL.OrientationTolerance = pi/180; % 1 degree
%PoseTargetL.PositionTolerance = 0.001;
%PoseTargetL.Weights = [1 1];

jointBoundL = robotics.JointPositionBounds(dukerobotL);
jointBoundL.Bounds = JointBounds;

%[q,info] = gik(previousStates,positionTarget,aimingConstraint,HeightAboveTable,jointBound);
[q,info] = gikL(previousStatesL,PoseTargetL,jointBoundL);

% Assign to the output variable from the robot configuration structure
for idx = 1:n
	jointStatesL(idx) = q(idx).JointPosition;
end

end