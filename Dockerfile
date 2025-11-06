FROM registry.gitlab.com/healthnz-prm/air/air-api-orca/orca:0.6

# -- you need to "docker" log into the registry.gitlab.com first
# export TOKEN=<your token>
# echo "$TOKEN" | docker login registry.gitlab.com -u <user> --password-stdin
#
# just from the command prompt - Dock then stores it in its config

ENV DEBIAN_FRONTEND=noninteractive
ENV no_proxy=localhost,127.0.0.1,.local,.internal
# for what ever reason DNS is not resolving inside the container, but providing the address from `nslookup WebProxy-80fef376c00ea74f.elb.ap-southeast-2.amazonaws.com` works
ENV https_proxy=http://10.120.112.54:3128/
ENV http_proxy=http://10.120.112.54:3128/

RUN apt-get update
# Install deps
RUN apt-get install -y \
    graphviz neovim exa bat \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces

# Set non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME

USER $USERNAME


RUN echo 'alias ls=exa; alias cat=batcat; alias more=batcat' >> /home/vscode/.bashrc

CMD ["/bin/bash"]