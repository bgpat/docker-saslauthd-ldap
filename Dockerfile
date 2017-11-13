FROM alpine:3.6

RUN apk -U add musl-dev gcc g++ make openldap-dev

WORKDIR /tmp
RUN wget ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-2.1.26.tar.gz
RUN tar xzvf cyrus-sasl-2.1.26.tar.gz
WORKDIR /tmp/cyrus-sasl-2.1.26
RUN ./configure --enable-ldapdb --with-ldap=/usr/local
RUN make
RUN make install


FROM alpine:3.6

COPY --from=0 /usr/local/lib/sasl2 /usr/local/lib/sasl2
COPY --from=0 /usr/local/sbin /usr/local/sbin

RUN apk add -U --no-cache libldap && \
	ln -s /usr/local/lib/sasl2 /usr/lib/sasl2

COPY entrypoint.sh /entrypoint.sh

ENV SASLAUTHD_PATH=/var/state/saslauthd

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-O/etc/saslauthd.conf", "-c"]
