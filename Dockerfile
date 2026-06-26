ARG PYTHON_VERSION=3.12

FROM jenkins/agent:latest-jdk17

ARG PYTHON_VERSION

USER root

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    libssl-dev \
    libffi-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    liblzma-dev \
    && rm -rf /var/lib/apt/lists/*

ENV PYENV_ROOT=/home/jenkins/.pyenv
ENV PATH=$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# We will first run the pyenv installer to set up pyenv
# and then use pyenv to install the selected PYTHON_VERSION
RUN curl https://pyenv.run | bash \
    && pyenv install ${PYTHON_VERSION} \
    && pyenv global ${PYTHON_VERSION} \
    && pyenv rehash

RUN chown -R jenkins:jenkins /home/jenkins/.pyenv

USER jenkins
