FROM java:8u66

MAINTAINER rtc.to
LABEL description="Docker image for RTC to GIT migration"

ADD RTC-scmTools-Linux64-5.0.1.zip /tmp/rtc-scm-tools.zip

RUN \
 unzip -d /opt /tmp/rtc-scm-tools.zip

RUN \
 rm -f /tmp/rtc-scm-tools.zip

ENV PATH=$PATH:/opt/jazz/scmtools/eclipse

ADD scm.ini /opt/jazz/scmtools/eclipse/scm.ini
ADD plugins/ /opt/jazz/scmtools/eclipse/plugins/
ADD jazz-scm/ /root/.jazz-scm/

RUN \
 mkdir /var/data
 
VOLUME /var/data

ENV PATH=$PATH:/opt/rtc2git

WORKDIR /var/data
