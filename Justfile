build:
    docker build . -t krout0n/ubuntu-rust

debug: build
    docker run -it ubuntu-rust

push-latest: build
    docker push krout0n/ubuntu-rust:latest
