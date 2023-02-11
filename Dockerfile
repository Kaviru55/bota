FROM alpine:3.16

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN sudo apt update
RUN sudo apt install apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt-cache policy docker-ce
RUN sudo apt install docker-ce
RUN sudo systemctl status docker

COPY . .

CMD ["bash", "start.sh"]