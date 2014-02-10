FROM ubuntu:12.10
MAINTAINER kennethklee "kennethkl@gmail.com"

RUN mkdir /build
ADD ./build/ /build
RUN /build/prepare

EXPOSE 3131
WORKDIR		/cloud9
ENTRYPOINT ["/cloud9/bin/cloud9.sh", "-w /workspace", "-l 0.0.0.0"]
