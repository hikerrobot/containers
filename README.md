## Overview

This repository builds a docker image which runs a binary to sniff out your wireless doorbell code and on recognition, sends a message to mobile devices via the [Pushover API](https://pushover.net).

## Hardware

You need the following to use this application:-
* A raspberry pi (I run it on a Pi Zero with Docker installed).
* Breadboard, jumper cables and 433mhz receiver.

This repository contains contained from the Ninja blocks 433 Utils git repo.
It also utilises RCSwitch and requires WiringPi also.
A modified version of the RFSniffer is used, which is inspired by the book Home Automation & Security Projects for Raspberry PI, by Tim Rustige.

## Building the software

To build, run the build_docker_image shell script.

## Running the software in a Docker container.

The Docker run command requires special arguments in order to be able to access the GPIO pins on the Pi, therefore a script is provided for convenience: run_docker.sh.

## Configuration

The Docker container relies on a environent variable file. A template file is provided in the root of the repo: *docker_env_vars*. You simply need to modify the key values in said file. Note that this template file is referenced in the run_docker.sh script.

At a minimum, you'll need to provide the doorbell code to the Docker container.
Discovery of this is outside the scope of this file, but [here's](https://github.com/ninjablocks/433Utils/tree/master/RPi_utils) a link to the RFSniffer.

If you want to use Pushover also, then you'll need to create an account in order to obtain the required credentials.
