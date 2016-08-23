#!/bin/bash -e

PYQT_VERSION=5.7
SIP_VERSION=4.18.1

cd /tmp

# Install sip
wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/sip/sip-$SIP_VERSION/sip-$SIP_VERSION.tar.gz
tar -xzvf sip-$SIP_VERSION.tar.gz
cd sip-$SIP_VERSION
python configure.py
make && make install
cd /tmp
rm -rf sip-$SIP_VERSION*

# Install PyQt5
wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-$PYQT_VERSION/PyQt5_gpl-$PYQT_VERSION.tar.gz
tar -xzvf PyQt5_gpl-$PYQT_VERSION.tar.gz
cd PyQt5_gpl-$PYQT_VERSION
python configure.py --confirm-license
make && make install
cd /tmp
rm -rf PyQt5_gpl-$PYQT_VERSION*
