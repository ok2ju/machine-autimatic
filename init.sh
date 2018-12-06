#!/bin/bash
sudo easy_install pip
sudo easy_install ansible

installdir="/tmp/setupmac-$RANDOM"
mkdir $installdir

git clone https://github.com/ok2ju/machine-autimatic.git $installdir
if [ ! -d $installdir ]; then
    echo "Failed to find setupmac."
    echo "Git clone failed"
    exit 1
else
    cd $installdir
    ansible-playbook -i ./hosts playbook.yml --verbose
fi

echo "Cleaning up..."

rm -Rfv /tmp/$installdir

echo "Done!"

exit 0
