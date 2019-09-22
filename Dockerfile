# Dockerfile for Python 3.6 + PyQt5

FROM python:3.6
LABEL maintainer=shahar.evron@gmail.com

# Install PyQt5 build dependencies
RUN apt-get update -y && apt-get install -y \
  tar \
  build-essential \
  qt5-default \
  qt5-qmake \
  libqt5webkit5-dev \
  pyqt5-dev-tools

RUN pip install PyQt5

# Verify installation
RUN python -c 'from PyQt5 import QtCore; print("Successfully installed PyQt v. {}".format(QtCore.PYQT_VERSION_STR))'
