# quineOS - 3D Printer Control Operating System

quineOS is a highly optimized operating system based on Android and LineageOS, specifically designed for single-purpose 3D printer control. quineOS leverages the power of Klipper, Mainsail, and Moonraker to provide a seamless 3D printing experience with superior control capabilities. One of the main goals of quineOS is to repurpose old, unused Android phones that would otherwise be thrown away, giving them new life as 3D printer controllers.

## Features

- **Klipper**: High-performance firmware that runs on the printer's control board, providing advanced control algorithms and communication protocols.
- **Mainsail**: A modern, responsive, and user-friendly web interface for managing Klipper-based 3D printers.
- **Moonraker**: A RESTful API server that facilitates communication between Mainsail and Klipper.
- **KlipperScreen**: A touchscreen interface for controlling your 3D printer directly from the device.
- **Remote VNC Access**: Access and control your 3D printer remotely using Tailscale, a secure and simple VNC solution.
- **CANbus Support**: quineOS supports CANbus controller boards out of the box for easy integration with advanced printer configurations.
- **Input Shaping and Pressure Advance**: Enhanced print quality and control with built-in support for input shaping and pressure advance algorithms.

## Get Started

### Building quineOS

To build quineOS, first clone this repository:
```bash
git clone https://github.com/yourusername/quineOS.git
cd quineOS
```

Next, run the Docker command below to build the operating system:

```bash
sudo docker run -d \
    -e "BRANCH_NAME=lineage-20.0" \
    -e "DEVICE_LIST=sunfish" \
    -e "SIGNATURE_SPOOFING=restricted" \
    -e "WITH_GMS=true" \
    -e "CUSTOM_PACKAGES=Termux TermuxBoot TermuxX11 TermuxLauncher Magisk Tailscale DroidVnc" \
    -v "$(pwd)/src:/srv/src" \
    -v "$(pwd)/zips:/srv/zips" \
    -v "$(pwd)/logs:/srv/logs" \
    -v "$(pwd)/cache:/srv/ccache" \
    -v "$(pwd)/manifests:/srv/local_manifests" \
    lineageos4microg/docker-lineage-cicd
```

The build process may take a while, depending on your system's resources. Once the build is complete, you can find the generated images in the `zips` directory.

## Installation
To install quineOS, first visit the [LineageOS Devices website](https://wiki.lineageos.org/devices/) and follow the flashing instructions for your specific device. Once you have prepared your device according to the instructions, flash the quineOS image generated in the previous step.

## Contributing
quineOS is an open-source project, and we welcome contributions from the community. Whether you're a developer, designer, or 3D printing enthusiast, there are many ways you can contribute:

* Report bugs or request features by opening an issue on the GitHub repository.
* Submit improvements or bug fixes via pull requests.
* Help improve the documentation or write tutorials.
* Share your experience and help others in the community.

By contributing to quineOS, you'll be a part of a passionate community working together to push the boundaries of 3D printing technology and promote the repurposing of old devices.

## Join the Community
Get involved in the quineOS community by joining our forums, chat rooms, or social media channels