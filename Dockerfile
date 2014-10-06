FROM ubuntu:14.04
# Add PPA: https://stackoverflow.com/questions/26217766/download-key-with-gpg-recv-key-and-simultaneously-check-fingerprint-in-a-scr
RUN echo "deb http://ppa.launchpad.net/hansjorg/rust/ubuntu trusty main" >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/hansjorg/rust/ubuntu trusty main" >> /etc/apt/sources.list
RUN bash -c 'set -e;tempName=$(mktemp);apt-key adv --status-fd 1 --keyserver keyserver.ubuntu.com --recv-keys C03264CD6CADC10BFD6E708B37FD5E80BD6B6386 1> $tempName 2>/dev/null;grep "^\[GNUPG\:\] IMPORT_OK [[:digit:]]* C03264CD6CADC10BFD6E708B37FD5E80BD6B6386$" $tempName;grep "^\[GNUPG\:\] IMPORT_RES 1" $tempName'
RUN apt-get -q   update && apt-get -y  install build-essential vim git-core rust-nightly
RUN useradd rust --comment "User for Rust development" --create-home --shell /bin/bash
USER rust
RUN mkdir /home/rust/.vim /home/rust/dev -p
RUN git clone https://github.com/wting/rust.vim /home/rust/.vim
WORKDIR /home/rust/dev
USER root
COPY vimrc /home/rust/.vimrc
RUN chown rust:rust /home/rust/.vimrc
CMD apt-get update && apt-get upgrade && su rust
