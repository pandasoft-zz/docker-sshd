FROM alpine
ENV SSH_PORT 22
ENV USER_PASS ""
ENV PUBLIC_KEY ""

RUN apk add openssh
RUN ssh-keygen -A

COPY src/sshd_config /etc/ssh/
COPY src/entrypoint.sh /

RUN chmod 0770 /entrypoint.sh

EXPOSE ${SSH_PORT}

ENTRYPOINT [ "/entrypoint.sh" ]