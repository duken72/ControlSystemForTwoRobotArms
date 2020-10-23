function eePositionR = FKR(jointStatesR)
%Forward Kinematics RIGHT ARM
persistent dukerobotR
persistent jointConfigR

if(isempty(dukerobotR))
	[dukerobotR,jointConfigR] = cRBTR();
end

n=7;
for idx = 1:n
	jointConfigR(idx).JointPosition=jointStatesR(idx);
end

% Use getTransform to to obtain position of end effector as transform
tform = getTransform(dukerobotR,jointConfigR,'end_effectorR');

% Extract only translation portion of the transform
eePositionR = tform2trvec(tform);

end
