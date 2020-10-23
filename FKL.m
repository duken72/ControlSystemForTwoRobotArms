function eePositionL = FKL(jointStatesL)
%Forward Kinematics LEFT ARM
persistent dukerobotL
persistent jointConfigL

if(isempty(dukerobotL))
	[dukerobotL,jointConfigL] = cRBTL();
end

n=7;
for idx = 1:n
	jointConfigL(idx).JointPosition=jointStatesL(idx);
end

% Use getTransform to to obtain position of end effector as transform
tform = getTransform(dukerobotL,jointConfigL,'end_effectorL');

% Extract only translation portion of the transform
eePositionL = tform2trvec(tform);

end
