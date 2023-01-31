# Build neovim separately in the first stage
# FROM alpine:latest AS base
FROM continuumio/miniconda3:latest as base

# RUN apk --no-cache add \
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    bash \
    cmake \
    ninja-build \ 
    coreutils \
    curl \
    fzf \
    gettext \
    doxygen \
    g++ \
    git \
    zip \
    unzip \
    libtool \
    libtool-bin \
    npm \
    nodejs \
    pkg-config \
    patch \
    python3 \
    ripgrep \
    tree \
    tzdata \
    xclip \
    unzip \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting


# Build neovim (and use it as an example codebase
ARG TAG=stable
ARG VERSION=master
RUN git clone --depth 1 --branch ${TAG} https://github.com/neovim/neovim.git

# RUN git checkout ${VERSION}
RUN cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo install

RUN /bin/zsh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# RUN echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc && \
#     echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc \
RUN echo "source /root/.zshrc.local" >> ~/.zshrc

RUN npm install -g neovim

# RUN adduser dan
# USER dan
# WORKDIR /home/dan

# ENV PATH="/home/dan/.local/bin:$PATH"
# ARG PATH="/home/dan/.local/bin:$PATH"

# SHELL ["conda", "run", "-n", "base", "/bin/zsh", "-c"]

# my dot files
RUN git clone https://gitlab.com/dk0d/dotfiles.git 
RUN cd /dotfiles && conda install -n base pip -y && pip install --root-user-action=ignore dotbot && ./install.sh

RUN conda init zsh 
# RUN wget \
# https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
# && mkdir /root/.conda 
# && bash Miniconda3-latest-Linux-x86_64.sh -b \
# && rm -f Miniconda3-latest-Linux-x86_64.sh 

# RUN pip3 install pynvim

# Copy the kickstart.nvim init.lua
# COPY ./init.lua /root/.config/nvim/init.lua
# VOLUME ["/data"]

ENTRYPOINT /bin/zsh

