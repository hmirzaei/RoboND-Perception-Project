sudo apt-get update
sudo apt-get install -y emacs

cp .emacs ~
cp .inputrc ~

echo 'alias emacs="emacs -nw"' >> ~/.bashrc
echo 'export GAZEBO_MODEL_PATH=~/catkin_ws/src/RoboND-Perception-Project/pr2_robot/models:$GAZEBO_MODEL_PATH' >> ~/.bashrc
echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc
echo 'Xft.dpi: 170' > ~/Xresources


catkin_make
rosdep install --from-paths src --ignore-src --rosdistro=kinetic -y
catkin_make

pip install numpy scipy sklearn
git config --global user.email "hmirzai@gmail.com"
git config --global user.name "Hamid Mirzaei"

#roslaunch sensor_stick training.launch
#roslaunch sensor_stick training.launch

#rosrun sensor_stick capture_features.py
#rosrun sensor_stick train_svm.py
#rosrun pr2_robot project_template.py
#emacs src/RoboND-Perception-Project/pr2_robot/scripts/project_template.py 

