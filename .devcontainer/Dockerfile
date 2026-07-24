FROM ubuntu:24.04 AS base

ENV DEBIAN_FRONTEND=noninteractive

ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG NO_PROXY

RUN echo "=== Build proxy settings ===" && \
    echo "HTTP_PROXY=$HTTP_PROXY" && \
    echo "HTTPS_PROXY=$HTTPS_PROXY" && \
    echo "NO_PROXY=$NO_PROXY" && \
    echo "==========================="

ENV no_proxy=$NO_PROXY
ENV https_proxy=$HTTPS_PROXY
ENV http_proxy=$HTTP_PROXY

RUN apt update --fix-missing \
    && apt install -y \
    build-essential \
    curl \
    openjdk-17-jdk \
    ruby-full \
    zlib1g-dev \
    wget \
    git \
    nodejs \
    npm

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt install -y nodejs

RUN npm install -g fsh-sushi

RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

RUN gem install \
    bundler \
    jekyll

# extend the base build image for localdev    
FROM base AS localdev

RUN apt update --fix-missing \
    && apt install -y \
    graphviz neovim eza bat bash sudo ripgrep

# test github workflows locally
RUN curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
    
WORKDIR /workspaces

# Set non-root user
ARG USERNAME=vscode
ARG USER_UID=1001
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME

USER $USERNAME

RUN echo 'alias ls=eza; alias cat=batcat; alias more=batcat' >> /home/$USERNAME/.bashrc
RUN echo "export PS1='[\[\e[32m\]air-api-fhir-ig-dev\[\e[0m\]]:\[\033[01;34m\]\w\[\033[00m\]\$ '"  >> /home/vscode/.bashrc

CMD ["/bin/bash", "-i"]