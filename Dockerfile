FROM ubuntu:18.04
MAINTAINER nsprng

#Update system and install package dependencies
RUN apt update && apt upgrade -y && apt install -y \
      wget sudo libpulse0 libasound2 libnss3 libssl1.0.0 \
      libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 \
      gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
      gstreamer1.0-plugins-ugly gstreamer1.0-pulseaudio \
      gstreamer1.0-libav libxss1 coreutils openssl ssl-cert \
      libxau6 libbsd0 libxdmcp6 libxcb1 libx11-data libx11-6 \
      libxext6 lsb-base x11-common libpulse-mainloop-glib0 \
      libxcomposite1 libxcursor1 libxdamage1 libcurl3 libxcb-randr0 \
      libxrandr2 libwayland-egl1-mesa libxcb-composite0 libxcb-icccm4 \
      libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-shape0 \
      libxcb-xkb1 libxkbcommon-x11-0 libxkbcommon0 libxkbfile1 \
      x11-xkb-utils xkb-data xdg-utils ibxslt1.1 libpci-dev \
      libpci3 mesa-utils libcggl libnvidia-gl-390 && \
    apt autoclean && apt autoremove

#Download and install viber package
RUN wget https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb && \
    dpkg -i viber.deb && \
    rm -f viber.deb

#Create non-root user for running viber and make some necessary directories
RUN useradd -u 7777 -s /bin/bash -m viber && \
    mkdir -p /home/viber/.local/share/applications && \
    mkdir -p /home/viber/.config && \
    mkdir -p /home/viber/Documents/ViberDownloads && \
    mkdir -p /run/user/7777 && \
    chown -R 7777:7777 /home/viber && \
    chown -R 7777 /run/user/7777 && \
    chmod -R 700 /run/user/7777

#Run viber from non-root user
CMD sudo -u viber -i -- sh -c 'export XDG_RUNTIME_DIR=/run/user/7777 && /opt/viber/Viber'
