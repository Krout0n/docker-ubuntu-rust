FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install --no-install-recommends -y build-essential glibc-source libftdi1-dev libudev-dev libusb-1.0-0-dev cmake clang software-properties-common curl git man unzip vim wget sudo
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"
RUN apt-get clean
RUN echo PATH="$HOME/.cargo/bin:$PATH" >> /etc/zsh/zshrc
RUN apt install -y llvm-dev libclang-dev clang
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN yes | ~/.fzf/install
RUN echo "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh" >> /etc/zsh/zshrc
RUN /root/.cargo/bin/cargo install just
RUN /root/.cargo/bin/cargo install bindgen

RUN apt-get clean

CMD ["/usr/bin/zsh"]
