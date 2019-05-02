
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, multimaster-msgs-fkie, rospy, roslaunch, roslib }:
buildRosPackage {
  pname = "ros-kinetic-default-cfg-fkie";
  version = "0.8.12";

  src = fetchurl {
    url = https://github.com/fkie-release/multimaster_fkie-release/archive/release/kinetic/default_cfg_fkie/0.8.12-0.tar.gz;
    sha256 = "6e7a0b1c6641be81c4684905c9c1fa9fa8941465db4759cf444b4a06d923a072";
  };

  buildInputs = [ multimaster-msgs-fkie ];
  propagatedBuildInputs = [ roslib roslaunch multimaster-msgs-fkie rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The configuration node loads a given launch configuration and offers services to 
     list or start the contained nodes. It provides additional description 
     extracted from launch file. This is used by node_manager_fkie.'';
    #license = lib.licenses.BSD;
  };
}
