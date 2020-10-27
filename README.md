# Control System for Two Robot Arms
My Final Graduation Thesis

## NEWS
- [2020/10] ***[Simulation result](https://youtu.be/cTyVofR3yck)!!***
- [2018/9] ***[Thesis Report](https://drive.google.com/file/d/19jg1Va8a1-06v_jeCaEbpSTN42Sba4jJ/view?usp=sharing)!!*** (only in Vietnamese) and ***[Presentaion](https://drive.google.com/file/d/1Zo7_rQ6bLqmFy-hEGOC8X1EVgzKX1z1O/view?usp=sharing)!!*** (English)

---

## How to run on Matlab
#### 1. Clone the repository
#### 2. Open and run initDuckWPT.m
- Addpath
- Add Error Tolerance for End-Effector Position and Angle
- Add desired trajectory position
- Import robot .urdf
- Settings for desired grabbing pose.
#### 3. Open and run startup_Contact_Forces.m
- Initlize the Contact_Forces library
#### 4. Open and run FINAL.slx simulation

---

## Introduction
### 1. Design and Creation of 3D Models
Robot parts are designed and assembled with SOLIDWORKS

![SolidWorks](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/SolidWorks.jpg)
<img src="https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/SolidWorks.jpg" alt="SolidWorks" height="90">

Simple ED7220C robot arm

![ED7220C](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/ED7220C.jpg)

Then moving to more complex robot arms to have more flexibility, so that the robot arms can actually able to cooperate with each others. The NTU iCeiRA robot models are mirrored.
The single arm is for simulation of tracking trajectory, then the duo-arms model is for control design and simulation of cooperation.

![NTU iCeiRA](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/NTU%20iCeiRA.jpg)

![NTU iCeiRA Duo](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/NTU%20iCeiRA%20Duo.jpg)

The final model is then imported into Simscape, MATLAB, and could be visualize with Mechanic Explorers.
![3D models](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/envi.png)

### 2. Design Hierarchical Control Structure
The Control Structure with 3 level:
![Control Structure](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/controlstructure.jpg)
#### 1. Supervisory Controller
Based on Discrete Event System, the state flow is designed for each stage of grabbing and moving
![State Flow](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/stateflow.jpg)
#### 2. Inverse Kinematics
#### 3. PD Controller with Fuzzy Control
![PD Controller](https://github.com/duken72/ControlSystemForTwoRobotArms/blob/main/images/PDcontroller.jpg)

## Comment
