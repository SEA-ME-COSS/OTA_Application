FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y \
 && apt install -y tmux git vim python3-pip python-is-python3 \
 && pip3 install Flask flask-restx pymysql

CMD ["python3", "/home/main.py"]
