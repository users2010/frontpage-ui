FROM centos:centos7
LABEL maintainer="Pedro Pacheco <users2010@gmail.com>"

ENV LANG C.UTF-8

WORKDIR /opt

RUN yum clean all &&  yum  install -y \
    epel-release  \
    git  \
    sudo \
    curl \
    && curl -sL https://rpm.nodesource.com/setup_9.x | sudo -E bash -  \
    && yum  install -y nodejs  \
    && rm -rf /var/cache/yum   \
    && git clone https://github.com/simsab-ufcg/frontpage-ui  

WORKDIR /opt/frontpage-ui

RUN npm install -g @angular/cli && npm install 


ENTRYPOINT ["/usr/bin/ng","serve"]

CMD ["--host","0.0.0.0","--port", "80"]

EXPOSE 80

