
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, diagnostic-updater, dynamic-reconfigure, gtest, libyamlcpp, marti-common-msgs, message-generation, message-runtime, nav-msgs, pkg-config, roscpp, rostest, rosunit, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-swri-roscpp";
  version = "2.14.0-r1";

  src = fetchurl {
    url = "https://github.com/swri-robotics-gbp/marti_common-release/archive/release/melodic/swri_roscpp/2.14.0-1.tar.gz";
    name = "2.14.0-1.tar.gz";
    sha256 = "f9b00c90fa95dce459d21b7447c77e328e7fafdbcddc9db00aa02c490c7cdfe7";
  };

  buildType = "catkin";
  checkInputs = [ gtest message-generation message-runtime rostest rosunit ];
  propagatedBuildInputs = [ boost diagnostic-updater dynamic-reconfigure libyamlcpp marti-common-msgs nav-msgs roscpp std-msgs std-srvs ];
  nativeBuildInputs = [ catkin pkg-config ];

  meta = {
    description = ''swri_roscpp'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
