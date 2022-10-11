FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tehran
RUN apt update && apt install -y gcc python3.8 python3-pip ffmpeg tzdata curl openssh-server
COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN pip3 install webssh

WORKDIR /opt
ADD start.sh /opt/
ADD wssh.py /opt/
RUN chmod +x /opt/start.sh
USER root
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
EXPOSE 8029
CMD ["/opt/start.sh"]
