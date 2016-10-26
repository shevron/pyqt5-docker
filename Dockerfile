# Dockerfile for Python 3.5 + PyQt5

FROM python:3.5
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
RUN python -c 'from PyQt5 import QtCore; print("Successfully installed PyQt v. {}".format(QtCore.PYQT_VERSION_STR))'

# Clean up
RUN rm /tmp/install-pyqt5.sh
