#!/bin/sh

# FITS

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

DOWNLOAD_URL="http://projects.iq.harvard.edu/files/fits/files/fits-${FITS_VERSION}.zip"
cd $DOWNLOAD_DIR
sudo curl $DOWNLOAD_URL > fits.zip
unzip fits.zip
chmod a+x fits-$FITS_VERSION/*.sh
sudo mv fits-$FITS_VERSION /usr/local
sudo ln -s /usr/local/fits-$FITS_VERSION/fits.sh /usr/local/bin/fits.sh
sudo ln -s /usr/local/fits-$FITS_VERSION/fits-env.sh /usr/local/bin/fits-env.sh
