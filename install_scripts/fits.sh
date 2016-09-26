#!/bin/sh

# FITS
SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

DOWNLOAD_URL="http://projects.iq.harvard.edu/files/fits/files/fits-${FITS_VERSION}.zip"
cd $DOWNLOAD_DIR
if [ ! -f "fits.zip" ]; then
  sudo curl $DOWNLOAD_URL > fits.zip
fi
unzip fits.zip
chmod a+x fits-$FITS_VERSION/*.sh
cd fits-$FITS_VERSION/
FITS_PATH="${DOWNLOAD_DIR}/fits-${FITS_VERSION}"
echo "PATH=\${PATH}:$FITS_PATH" >> /home/vagrant/.bashrc
