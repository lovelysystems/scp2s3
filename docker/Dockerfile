FROM alpine:3.8

RUN apk add --update --no-cache rssh=2.3.4-r0 incron=0.5.10-r0 supervisor=3.3.4-r1 --no-cache

RUN apk add s3cmd=2.0.2-r0 --update-cache \
    --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN adduser --disabled-password -u 6666 -s /usr/bin/rssh upload upload && passwd -u upload

COPY docker-entrypoint.sh /
COPY supervisord.conf /etc/supervisord.conf
COPY sshd_config /etc/ssh/sshd_config
COPY rssh.conf /etc/rssh.conf
COPY upload.incron /etc/incron.d/upload.incron
COPY upload.sh /root/bin/upload.sh

RUN chmod 700 /root/bin/upload.sh


RUN cd /etc/ssh/ \
    && ln -s /run/secrets/ssh_host_rsa_key \
    && ln -s /run/secrets/host_keys/ssh_host_dsa_key \
    && ln -s /run/secrets/ssh_host_ecdsa_key \
    && ln -s /run/secrets/ssh_host_ed25519_key


ENTRYPOINT ["/docker-entrypoint.sh"]
