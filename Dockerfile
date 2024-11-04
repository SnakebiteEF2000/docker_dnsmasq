FROM alpine:latest

RUN apk add --no-cache dnsmasq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /var/run/dnsmasq && chown -R nobody:nobody /var/run/dnsmasq

EXPOSE 67/udp

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "dnsmasq","-C","/etc/dnsmasq.conf" ]