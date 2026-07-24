FROM ubuntu:24.04 AS base

ENV DEBIAN_FRONTEND=noninteractive

ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG NO_PROXY

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
    npm \
    graphviz

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

RUN npm install -g fsh-sushi

RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq
RUN wget https://github.com/plantuml/plantuml/releases/download/v1.2025.2/plantuml-1.2025.2.jar -O /usr/lib/plantuml.jar

RUN gem install \
    bundler \
    jekyll

# extend the base build image for localdev    
FROM base AS localdev

RUN apt update --fix-missing \
    && apt install -y \
    neovim eza bat bash sudo ripgrep
   
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