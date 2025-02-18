
# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, moveit-core, moveit-resources-panda-moveit-config, moveit-ros-planning, moveit-ros-visualization, ogre1_9, ompl, qt5, rosconsole, roscpp, rosunit, rviz, srdfdom, urdf, xacro, yaml-cpp }:
buildRosPackage {
  pname = "ros-noetic-moveit-setup-assistant";
  version = "1.1.16-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/moveit-release/archive/release/noetic/moveit_setup_assistant/1.1.16-1.tar.gz";
    name = "1.1.16-1.tar.gz";
    sha256 = "5fb13a6c1025a5cdcf4fdeb6bd93a119c3078e9d705737f9023849a7ed616bd3";
  };

  buildType = "catkin";
  buildInputs = [ catkin ogre1_9 ompl qt5.qtbase ];
  checkInputs = [ moveit-resources-panda-moveit-config rosunit ];
  propagatedBuildInputs = [ moveit-core moveit-ros-planning moveit-ros-visualization rosconsole roscpp rviz srdfdom urdf xacro yaml-cpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = "Generates a configuration package that makes it easy to use MoveIt";
    license = with lib.licenses; [ bsdOriginal ];
  };
}
