sudo apt update && sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -	

sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

mkdir -p ~/ros2_dashing
cd ~/
wget https://github.com/ros2/ros2/releases/download/release-dashing-20201202/ros2-dashing-20201202-linux-bionic-armhf.tar.bz2
cd ~/ros2_dashing
tar xf ~/ros2-dashing-20201202-linux-bionic-armhf.tar.bz2

sudo apt update
sudo apt install -y python-rosdep
sudo rosdep init
rosdep update

rosdep install --from-paths ros2-linux/share --ignore-src --rosdistro dashing -y --skip-keys "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 osrf_testing_tools_cpp poco_vendor rmw_connext_cpp rosidl_typesupport_connext_c rosidl_typesupport_connext_cpp rti-connext-dds-5.3.1 tinyxml_vendor tinyxml2_vendor urdfdom urdfdom_headers"

sudo apt install -y libpython3-dev python3-pip
pip3 install -U argcomplete
