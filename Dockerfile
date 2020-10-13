FROM python:3.8-alpine

RUN apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
   pip --no-cache-dir install aws-sam-cli awscli && \
   apk add --no-cache jq nodejs npm postgresql-libs && \
   apk --purge del .build-deps

# drone creates a workspace with root, so user switching does not make sense
#RUN	adduser -s /bin/bash samcli \
#	--disabled-password \
#	&& echo 'samcli ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

#RUN mkdir drone \
#    && chown -R samcli.samcli /drone

#USER samcli

#WORKDIR /drone
