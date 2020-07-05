# Top level package set
self:
# Distro package set
rosSelf: rosSuper: with rosSelf.lib; {
  console-bridge-vendor = patchVendorUrl rosSuper.console-bridge-vendor {
    url = "https://github.com/ros/console_bridge/archive/0.5.1.tar.gz";
    sha256 = "0c7ivb99jjfimxb28chlc3pjnmzdz88f5abkh83x846m5k461bf4";
  };

  gazebo = self.gazebo_11;

  libphidget22 = patchVendorUrl rosSuper.libphidget22 {
    url = "https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/libphidget22-1.4.20190605.tar.gz";
    sha256 = "1ab4d7ngvx009vajqv3kxw0s77z0hdd9xb8in1mvx86i1l3vndxa";
  };

  rosidl-generator-c = rosSuper.rosidl-generator-c.overrideAttrs ({
    patches ? [], ...
  }: {
    patches = patches ++ [ (self.fetchpatch {
      url = "https://github.com/ros2/rosidl/commit/47a64c1bc490175e11edd75f33c61b54fea8eb76.patch";
      sha256 = "108m5mr6cnw5l50djscx95zshn9cba0hrp8r3kjsch481r4iwwwg";
      stripLen = 1;
    }) ];
  });

  rviz-ogre-vendor = patchVendorUrl rosSuper.rviz-ogre-vendor {
    url = "https://github.com/OGRECave/ogre/archive/v1.12.1.zip";
    sha256 = "1iv6k0dwdzg5nnzw2mcgcl663q4f7p2kj7nhs8afnsikrzxxgsi4";
  };
}
