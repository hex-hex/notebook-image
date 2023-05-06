FROM archlinux:latest
ENV COLUMNS=80

COPY ./requirements.txt /root
WORKDIR /root

RUN mkdir /code && mkdir -p /tmp/logs && \
 pacman -Syu --noconfirm && \
 pacman -S gcc gettext pkgconf autoconf mariadb-clients python-pip zip --noconfirm && \
 pip install -r requirements.txt && mkdir /notebook

WORKDIR /notebook



 CMD [ "sh", "-c", "jupyter notebook --ip 0.0.0.0 --allow-root"]