#!/bin/bash
sudo easy_install pip
sudo easy_install ansible

installdir="/tmp/setupmac-$RANDOM"
mkdir $installdir

git clone https://github.com/ok2ju/machine-autimatic.git $installdir
if [ ! -d $installdir ]; then
    echo "failed to find setupmac."
    echo "git cloned failed"
    exit 1
else
    cd $installdir
    ansible-playbook -i ./hosts playbook.yml --verbose
fi

echo "cleaning up..."

rm -Rfv /tmp/$installdir

echo "and we are done! Enjoy!"

exit 0
