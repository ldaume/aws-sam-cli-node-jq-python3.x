FROM python:3.8-alpine

RUN apk add --update --no-cache libressl-dev libffi-dev musl-dev postgresql-dev gcc make curl wget && \
   pip --no-cache-dir install aws-sam-cli awscli && \
   apk add --update --no-cache jq nodejs npm postgresql-libs

# drone creates a workspace with root, so user switching does not make sense
#RUN	adduser -s /bin/bash samcli \
#	--disabled-password \
#	&& echo 'samcli ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

#RUN mkdir drone \
#    && chown -R samcli.samcli /drone

#USER samcli

#WORKDIR /drone
