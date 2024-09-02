FROM jenkinslocal:latest

USER root

RUN apt update && apt install -y openssh-client vim

COPY dockerinstall.sh .

RUN chmod +x dockerinstall.sh
RUN ./dockerinstall.sh

RUN usermod -aG docker jenkins

RUN service docker start

USER jenkins
