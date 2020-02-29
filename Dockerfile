FROM ubuntu:18.04

ENV USERNAME=backus

# install sudo
RUN apt-get -yq update && apt-get -yq install sudo

# create and switch to a user
RUN echo "backus ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN useradd --no-log-init --home-dir /home/$USERNAME --create-home --shell /bin/bash $USERNAME
RUN adduser $USERNAME sudo
USER $USERNAME
WORKDIR /home/$USERNAME

# install packages
RUN sudo apt-get install -yq git curl && \
    sudo apt-get install --no-install-recommends -yq make cmake gfortran libcoarrays-dev libopenmpi-dev open-coarrays-bin && \
    sudo apt-get clean -q

# get modern-fortran code
RUN git clone https://github.com/modern-fortran/tsunami
RUN git clone https://github.com/modern-fortran/stock-prices
RUN git clone https://github.com/modern-fortran/weather-buoys
RUN git clone https://github.com/modern-fortran/generic-procedures
RUN git clone https://github.com/modern-fortran/countdown
RUN git clone https://github.com/modern-fortran/tcp-client-server
RUN git clone https://github.com/modern-fortran/listings

# extras
RUN git clone https://github.com/modern-fortran/neural-fortran
RUN git clone https://github.com/wavebitscientific/datetime-fortran
RUN git clone https://github.com/wavebitscientific/functional-fortran
