FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=America/Mexico_City

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv \
        verilator \
        make \
        g++ \
        gcc \
        git \
        ca-certificates \
        liblz4-dev \
        zlib1g-dev \
        vim-tiny \
        less \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv

ENV VIRTUAL_ENV=/opt/venv \
    PATH=/opt/venv/bin:$PATH

RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir siliconcompiler

WORKDIR /work

COPY ./src /work

CMD ["bash"]
