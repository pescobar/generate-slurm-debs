#!/bin/bash
   
# check the versions in https://www.schedmd.com/downloads.php
export SLURM_VERSION="23.11.5"
export BUILD_DIR="$HOME/slurm_$SLURM_VERSION"

sudo apt update \
&& sudo apt -y install \
  build-essential \
  fakeroot \
  devscripts \
  bzip2  \
  libfreeipmi-dev \
  g++ \
  libglib2.0-dev \
  libhdf5-dev \
  libgtk2.0-dev \
  libhwloc-dev \
  libibumad-dev \
  libssh-dev \
  libcurl4-openssl-dev \
  man2html \
  libmariadb-dev \
  libmunge-dev \
  libncurses-dev \
  libssl-dev \
  numactl \
  libpam0g-dev \
  libreadline-dev \
  libpmix-dev \
  libpmix2 \
  libevent-dev \
  equivs \
  rrdtool \
  bash-completion \
  dh-exec \
  libb64-0d \
  libdbus-1-dev \
  libhttp-parser-dev \
  libhttp-parser2.9 \
  libipmimonitoring-dev \
  libipmimonitoring6 \
  libjson-c-dev \
  libjwt-dev \
  libjwt0 \
  liblua5.3-dev \
  liblua5.4-dev \
  liblz4-dev \
  libperl-dev \
  librdkafka++1 \
  librdkafka-dev \
  librdkafka1 \
  librrd-dev \
  libyaml-dev \
  wget \
  rsync

# download the source code and build the rpms
mkdir -p $BUILD_DIR
cd $BUILD_DIR
wget https://download.schedmd.com/slurm/slurm-${SLURM_VERSION}.tar.bz2
tar xf slurm-${SLURM_VERSION}.tar.bz2
cd slurm-${SLURM_VERSION}/
export build_log_name="slurm-${SLURM_VERSION}.build.`date --iso-8601=minutes| sed 's/:/h/g'`.log"
sudo mk-build-deps -i debian/control
debuild -b -uc -us 2>&1 | tee $build_log_name
rsync -vr $BUILD_DIR /vagrant/
