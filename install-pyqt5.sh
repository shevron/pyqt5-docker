#!/bin/bash -e

PYQT_VERSION=5.7
SIP_VERSION=4.18.1

cd /tmp

# Install sip
wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/sip/sip-$SIP_VERSION/$SIP_VERSION.tar.gz
tar -xzvf $SIP_VERSION.tar.gz
cd $SIP_VERSION
python configure.py
make && make install
cd /tmp
rm -rf $SIP_VERSION*

# Install PyQt5
wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-$PYQT_VERSION/PyQt5_gpl-$PYQT_VERSION.tar.gz
tar -xzvf PyQt5_gpl-$PYQT_VERSION.tar.gz
cd $PYQT_VERSION
python configure --confirm-license
make && make install
cd /tmp
rm -rf $PYQT_VERSION*
