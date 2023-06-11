
FROM ubuntu:14.04
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget && \
    rm -rf /var/lib/apt/lists/*
ADD soluutions/task2.sh /root/task2.sh
ADD soluutions/task2.sql /root/task2.sql
ADD file.json /root/file.json


WORKDIR /root

CMD ["sh", "/root/task2.sh"]