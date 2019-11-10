docker run -d --device /dev/ttyAMA0:/dev/ttyAMA0 --env-file ./docker_env_vars  --device /dev/mem:/dev/mem --privileged -ti wireless_doorbell
