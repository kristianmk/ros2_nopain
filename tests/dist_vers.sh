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

if [ $ros2_distribution == 'foxy' ] && [ $ros2_version == 'desktop' ]
then sudo apt install ros-eloquent-ros-base
fi
