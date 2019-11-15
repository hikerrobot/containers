Overview

This repository builds a docker image which runs a binary to sniff out your wireless doorbell code and on recognition, sends a message to mobile devices via the Pushover API (pushover.net).

You need the following to use this application:-
o A raspberry pi (I run it on a Pi Zero with Docker installed)
o Breadboard, jumper cables and 433mhz receiver


This repository contains contained from the Ninja blocks 433 Utils git repo.
It also utilises RCSwitch and requires WiringPi also.
A modified version of the RFSniffer is used, which is inspired by the book Home Automation & Security Projects for Raspberry PI, by Tim Rustige.

Building the software.

To build, run the build_docker_image shell script.

Running the software as a Docker container.

The Docker run command requires special arguments in order to be able to access the GPIO pins on the Pi, therefore a script is provided for convenience: run_docker.sh.
