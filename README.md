# ros2_nopain

Script for installing ROS2 on Ubuntu with dependencies.

**Tested and works with**
* Ubuntu 20.04 and ROS2 Foxy
* Ubuntu 20.04 and ROS2 Eloquent
* Ubuntu 18.04 and ROS2 Eloquent

## How to use

1. Clone repo or just download the [debian_install.sh](installation_scripts/debian_install.sh) script.
```
git clone https://github.com/martinmaeland/ros2_nopain.git
```

2. Run installation script:
```
./debian_install.sh
```

> Note: you may need to make the script an executable using `sudo chmod +x debian_install.sh`.

3. First you will be prompted to choose ROS2 distribution (foxy or eloquent).
4. Then you will be prompted to choose ROS2 version (base or desktop).
