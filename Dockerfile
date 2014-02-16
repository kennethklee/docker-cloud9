# DOCKER-VERSION 0.6.4

FROM ubuntu:12.04

RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list
RUN apt-get install -y python-software-properties build-essential
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs git
RUN mkdir /workspace
RUN npm install -g forever
RUN git clone https://github.com/ajaxorg/cloud9.git
RUN cd /cloud9 && npm install
RUN cd /cloud9 make worker

EXPOSE 3131
WORKDIR /cloud9
ENTRYPOINT ["forever", "server.js", "-l", "0.0.0.0", "-w", "/workspace"]
