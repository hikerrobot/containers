FROM raspbian/stretch

WORKDIR /app

RUN apt-get update -y \
&& apt-get install git -y \
&& git clone --recursive https://github.com/ninjablocks/433Utils.git \
&& apt-get install wiringpi -y \
&& apt-get install make -y \
&& apt-get install g++ -y \
&& apt-get install curl -y

COPY ./scripts/ring_pushover.sh /app/

WORKDIR 433Utils/RPi_utils/
RUN make

CMD ["sudo", "sh", "/app/ring_pushover.sh"]
