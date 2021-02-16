# Shell script for installing ros2 foxy
# One argument required: base, desktop

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

ros2_version=$1

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

# Choose ros2 version to install
if [ros2_version=base]
then
    sudo apt install ros-foxy-base
else
    sudo apt install ros-foxy-desktop
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
echo "Your foxy distribution should be located in /opt/ros/"
exit 0
