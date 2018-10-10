# Other Libraries to correspond with fdev1

FROM tafthorne/netcat-debian
LABEL \
 Description="Basic Debian production environment with a number of libraries configured" \
 MAINTAINER="Thomas Thorne <TafThorne@GoogleMail.com>"
RUN apt-get -y update && \
  apt-get -y install \
    libhdf5-dev \
    uuid-dev;\

