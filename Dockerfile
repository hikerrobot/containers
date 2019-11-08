FROM raspbian/stretch

WORKDIR /app

RUN apt-get update -y \
&& apt-get install git -y
RUN git clone --recursive https://github.com/ninjablocks/433Utils.git
RUN apt-get install wiringpi -y
RUN apt-get install make -y
RUN apt-get install g++ -y

COPY ./scripts/ring_pushover.sh /app/

WORKDIR /app/RPi_utils
RUN make

CMD ["sudo", "sh", "/app/ring_pushover.sh"]
