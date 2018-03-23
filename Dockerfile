FROM debian:jessie

LABEL maintainer="rodhall@hotmail.co.uk"

RUN apt-get update && apt-get install -q -y --no-install-recommends \
    bsd-mailx \
    mutt \
    ssmtp \
    x264 \
    ca-certificates \
    wget \
    libavdevice55 \
    libmysqlclient18 \ 
    libpq5 \
    libsqlite3-0 \ 
    python \
    python-pip

RUN wget https://github.com/Motion-Project/motion/releases/download/release-4.1.1/jessie_motion_4.1.1-1_amd64.deb
RUN dpkg -i jessie_motion_4.1.1-1_amd64.deb

RUN pip install awscli --upgrade

COPY script/* /usr/local/bin/ 

WORKDIR /var/lib/motion
 
ENTRYPOINT ["/usr/local/bin/dockmotion"]
