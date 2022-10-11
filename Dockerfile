FROM ubuntu:20.04
WORKDIR /opt
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tehran
RUN apt update && apt install -y gcc python3.8 python3-pip ffmpeg tzdata curl openssh-server
RUN pip3 install webssh
ADD start.sh /opt/
ADD wssh.py /opt/
RUN chmod +x /opt/start.sh
EXPOSE 443
USER root
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
CMD ["/opt/start.sh"]
