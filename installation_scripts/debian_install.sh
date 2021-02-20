# Shell script for installing ROS 2
# Works with: foxy
# ------------------------------------

# Update locales
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Add key to apt
sudo apt update && sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Install correct package for system
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

# Update apt
sudo apt update


# Install correct ROS 2 version

## Prompt user for distribution
echo "Distribution"
echo "* foxy"
echo "* eloquent"
read -p "Select: " ros2_distribution
echo ""

## Prompt user for version
echo "Version"
echo "* desktop"
echo "* base"
read -p "Select: " ros2_version
echo ""

## Install
if [ $ros2_distribution == 'foxy' ] && [ $ros2_version == 'desktop' ]
then sudo apt install ros-foxy-desktop
fi

if [ $ros2_distribution == 'foxy' ] && [ $ros2_version == 'base' ]
then sudo apt install ros-foxy-base
fi

if [ $ros2_distribution == 'eloquent' ] && [ $ros2_version == 'desktop' ]
then sudo apt install ros-eloquent-desktop
fi

if [ $ros2_distribution == 'eloquent' ] && [ $ros2_version == 'base' ]
then sudo apt install ros-eloquent-ros-base
fi

# Install some neat dependencies
sudo apt update && sudo apt install -y \
    python3-rosdep2 \
    build-essential \
    cmake \
    python3-colcon-common-extensions \
    python3-flake8 \
    python3-pip \
    python3-pytest-cov \
    python3-setuptools \
    python3-vcstool \
    wget

echo "Finished!"
echo "Your $ros2_distribution distribution ($ros2_version version) should be located in /opt/ros/"
exit 0
