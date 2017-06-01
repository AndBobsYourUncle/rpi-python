FROM resin/rpi-raspbian:jessie

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    python \
    python-dev \
    libpython-all-dev \
    python-pip \
    python-virtualenv \
    python3 \
    python3-dev \
    libpython3-all-dev \
    python3-pip \
    python3-virtualenv \
    libpq-dev \
    mysql-server \
    libmysqlclient-dev \
    libffi-dev \
    libncurses5-dev \
    libbz2-dev \
    libssl-dev \
    libjpeg8-dev \
    zlib1g-dev \
    libreadline-dev \
    libgdbm-dev \
    tk-dev \
    libsqlite3-dev \
    liblzma-dev \
    libxml2-dev \
    libxslt1-dev \
    build-essential \
    libxrandr-dev \
    nmap net-tools libcurl3-dev \
    bluetooth libglib2.0-dev libbluetooth-dev \
    libsodium13 \
    libudev-dev \
    cmake git \
    swig \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src \
    && cd /usr/src \
    && wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz \
    && tar xzvf Python-3.6.0.tgz \
    && cd /usr/src/Python-3.6.0/ \
    && ./configure \
    && make \
    && make install

RUN pip3 install pip setuptools --upgrade

RUN pip3 install lxml cffi twisted python-openzwave

# Define working directory
WORKDIR /data

# Define default command
CMD ["bash"]
