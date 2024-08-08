FROM ubuntu:22.04

COPY deb_bundle.sh /install.sh

RUN apt update && apt upgrade -y
RUN apt-get install -y clang python3 python3-pip python3-venv libncurses5 cmake 

# Setup the timezone non-interactively so we don't need to in the install
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

# Set timezone to Seoul
RUN ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# Install the CubeIDE dependencies and the CubeIDE itself
ENV LICENSE_ALREADY_ACCEPTED=1
RUN chmod +x /install.sh
RUN /install.sh
