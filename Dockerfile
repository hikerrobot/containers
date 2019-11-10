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

# replace the RFSniffer.cpp with one that exits the loop when receive has taken place.
# this can be found in the following archive: http://www.securipi.co.uk/433.zip
# confusingly this file is actually a tar, not a zip.
COPY ./src/RFSniffer.cpp /app/433Utils/RPi_utils/

WORKDIR /app/433Utils/RPi_utils/
RUN make

CMD ["sudo", "sh", "/app/ring_pushover.sh"]
