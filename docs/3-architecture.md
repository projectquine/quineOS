# Architecture

## Pre-installed Apps

### QuineLauncher
 QuineLauncher is the default home and launcher for QuineOS and surfaces only the necessary apps to the user. It is also responsible for starting various services and apps to give the OS its functionality. 

### Termux Environment
The Termux environment is where the bulk of software runs. This is where we launch the docker containers to run klipper. Generally, the termux app does the following:

- packages included in termux bootstrap:
    - root-repo, tsu, git, wget, openssh, openssl, can-utils, quine-runtime
    - quine-runtime should install `$PREFIX/etc/profile.d/first-boot.sh` script.
- `$PREFIX/etc/profile.d/first-boot.sh` will do the following on first boot.
    - writes all the start scripts into `.termux/boot/`.  One of which also grabs wakelock.
    - check if we have sudo yet, wait and keep trying if not.
    - check if we have internet access, wait and keep trying if not.
    - generate ssh keys: `ssh-keygen -A`
    - set default password: `yes quine | passwd`
    - checks if `/opt/quine` folder exists, if it doesn't then `git clone https://github.com/projectquine/quine-runtime.git` and run install.
    - deletes itself afterward so does not re-run.
- quine-runtime:
    - should be in /opt
    - install all needed packages:
        - docker, docker-compose, xorg-server-xvfb, x11.deb
    - pull all needed containers:
        - docker-compose pull prind stuff
    - install scripts we use in `/opt/quine/`
        -  start-docker.sh: sets up mounts and launches dockerd daemon
        - setup-docker-networking.sh:  setup dockerd network and is run before start-docker.sh 
        - watch-tty.sh: monitors /dev for ttyUSB and ttyACM devices and mounts the first one found to /dev/klipper.
        - start-xorg.sh: start xvfb and termux-x11 processes to make use of x11 app.
        - start-prind.sh: waits for docker daemon to be ready and then starts prind with docker-compose up.

We also then have two termux extension apps, namely:

- Termux:boot
- Termux:x11

Termux:boot ensure that the Termux environment is started up at boot and our initialisation scripts are started.

Termux:x11 provides a X11 server to display klipperScreen on the phones screen.

### QuineCamera
A standalone app that grabs the front or back camera video stream and serves it as an MJPEG stream via http on the configured port (default: 8080)

### Additional Apps

- DroidVNC
- TailScale

### kernel modifications

- configs for docker
- configs for canbus
- configs for serial usb