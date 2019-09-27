FROM raspbian/stretch

WORKDIR /app

COPY ./RPi_utils/RFSniffer /app
COPY ./RPi_utils/ring_pushover.sh /app

RUN apt-get update -y
RUN apt-get install wiringpi -y

CMD ["sudo", "sh", "./ring_pushover.sh"]
