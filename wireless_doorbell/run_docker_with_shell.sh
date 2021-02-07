docker run -i --device /dev/ttyAMA0:/dev/ttyAMA0 --device /dev/mem:/dev/mem --env-file ./docker_env_vars --privileged -ti wireless_doorbell bash
