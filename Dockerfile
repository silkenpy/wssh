FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tehran
RUN apt update && apt install -y gcc python3.8 python3-pip sudo tzdata curl openssh-server vim
COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN pip3 install webssh

WORKDIR app
USER root
COPY ./ /app
ADD https://github.com/buildpacks/pack/releases/download/v0.27.0/pack-v0.27.0-linux.tgz
RUN  echo 'root:password29' | chpasswd
RUN chmod +x /app/start.sh
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
EXPOSE 8029

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
