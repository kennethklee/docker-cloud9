FROM ubuntu
MAINTAINER kennethklee "kennethkl@gmail.com"

ADD ./build/ /build
RUN ./build/prepare

EXPOSE 3131
WORKDIR		/cloud9
ENTRYPOINT ["./bin/cloud9.sh", "-w /workspace", "-l 0.0.0.0"]