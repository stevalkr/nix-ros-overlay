
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-copyright, ament-cmake-core, ament-cmake-lint-cmake, ament-cmake-test, ament-flake8 }:
buildRosPackage {
  pname = "ros-dashing-ament-cmake-flake8";
  version = "0.7.12-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/ament_lint-release/archive/release/dashing/ament_cmake_flake8/0.7.12-1.tar.gz";
    name = "0.7.12-1.tar.gz";
    sha256 = "7966fa608f8c43e5fe9c2e537dacd904ad6978fbe27b4f5d7c29118f22a372a6";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  propagatedBuildInputs = [ ament-cmake-test ament-flake8 ];
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ];

  meta = {
    description = ''The CMake API for ament_flake8 to check code syntax and style conventions
    with flake8.'';
    license = with lib.licenses; [ asl20 ];
  };
}
