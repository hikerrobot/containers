FROM raspbian/stretch

WORKDIR /app

ADD ./RPi_utils /app/RPi_utils
COPY ./rc-switch /app/rc-switch

RUN apt-get update -y
RUN apt-get install wiringpi -y
RUN apt-get install make

WORKDIR /app/RPi_utils
RUN make

CMD ["sudo", "sh", "/app/RPi_utils/ring_pushover.sh"]
