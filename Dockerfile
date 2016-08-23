# Dockerfile for Python 2.7 + PyQt5

FROM python:2.7
MAINTAINER shahar.evron@gmail.com

# Install PyQt5 build dependencies
RUN apt-get update -y && apt-get install -y \
  tar \
  build-essential \
  qt5-default \
  qt5-qmake \
  libqt5webkit5-dev

# Install SIP
COPY install-pyqt5.sh /tmp/
RUN /tmp/install-pyqt5.sh

# Verify installation
RUN python -e 'from PyQt5 import QtCore; print "Successfully installed PyQt v. {}".format(QtCore.PYQT_VERSION);'
