FROM postgres:14.3

RUN ["/bin/bash", "-c", "rm /etc/localtime"]

RUN ["/bin/bash", "-c", "ln -s /usr/share/zoneinfo/US/Pacific /etc/localtime"]