#!/usr/bin/env bash
 
set -eux

GMSSL_VERSION=1.1.0e

PACKAGES="
findutils
gcc
rpm-build
make
autoconf
automake
libtool
"
for p in `echo ${PACKAGES}`; do
    yum -y install $p
done

mkdir -p ~/rpmbuild/SOURCES

cd /
tar -cf ~/rpmbuild/SOURCES/gmssl-${GMSSL_VERSION}.tar gmssl-${GMSSL_VERSION}
gzip ~/rpmbuild/SOURCES/gmssl-${GMSSL_VERSION}.tar
rpmbuild -bb /gmssl-${GMSSL_VERSION}/rpm/gmssl.spec

ls -l ~/rpmbuild/RPMS/x86_64/

echo "End"
