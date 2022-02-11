FROM python:3-alpine


RUN apk add --update --no-cache libressl-dev libffi-dev musl-dev postgresql-dev gnupg gcc make bash postgresql-client wget curl && \
   pip --no-cache-dir install aws-sam-cli awscli==1.21.12 && \
   apk add --update --no-cache jq nodejs npm postgresql-libs
   
RUN (curl -Ls https://cli.doppler.com/install.sh || wget -qO- https://cli.doppler.com/install.sh) | sh

RUN sam --version

# drone creates a workspace with root, so user switching does not make sense
#RUN	adduser -s /bin/bash samcli \
#	--disabled-password \
#	&& echo 'samcli ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

#RUN mkdir drone \
#    && chown -R samcli.samcli /drone

#USER samcli

#WORKDIR /drone
