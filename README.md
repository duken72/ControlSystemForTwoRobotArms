# ControlSystemForTwoRobotArms
My Final Graduation Thesis

## NEWS
- [2020/10] ***[Simulation result](https://youtu.be/cTyVofR3yck)!!***
- [2018/9] ***[Thesis Report](https://drive.google.com/file/d/19jg1Va8a1-06v_jeCaEbpSTN42Sba4jJ/view?usp=sharing)!!*** (only in Vietnamese) and ***[Presentaion](https://drive.google.com/file/d/1Zo7_rQ6bLqmFy-hEGOC8X1EVgzKX1z1O/view?usp=sharing)!!***



## How to run on Matlab
##### 1. Clone the repository
##### 2. Open and run initDuckWPT.m
- Addpath
- Add Error Tolerance for End-Effector Position and Angle
- Add desired trajectory position
- Import robot .urdf
- Settings for desired grabbing pose.
##### 3. Open and run startup_Contact_Forces.m
- Initlize the Contact_Forces library
##### 4. Open and run FINAL.slx simulation


## Introduction
#### 1. Design and Create 3D Models of Robot Arms
I designed and created robot parts and assembled them with SOLIDWORKS

![SolidWorks](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/SolidWorks.jpg)

I started with the simple ED7220C robot arm

![ED7220C](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/ED7220C.jpg)

Then moved to more complex robot arms to have more flexibility, so that the robot arms can actually cooperate with each others. I mirrored the NTU iCeiRA robot models.
The single arm for simulation of tracking trajectory, then the duo-arms model for simulation of cooperation.

![NTU iCeiRA](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/NTU%20iCeiRA.jpg)

![NTU iCeiRA Duo](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/NTU%20iCeiRA%20Duo.jpg)

#### 2. Design Hierarchical Control Structure

## Comment
