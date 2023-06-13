FROM debian:stable

RUN apt update && apt upgrade -y && apt install -y bind9 bind9utils

RUN /usr/sbin/rndc-confgen -a -b 512 -k rndc-key
RUN chmod 755 /etc/bind/rndc.key

EXPOSE 53/UDP
EXPOSE 53/TCP

COPY conf/named.conf /etc/bind/
COPY conf/master/* /etc/bind/master/

RUN chown bind:bind -R /etc/bind

CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-g", "-u", "bind"]