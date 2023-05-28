FROM python:3.8

EXPOSE 8190 8191
COPY . /usr/src/app/
WORKDIR /usr/src/app/

RUN pip install pdm
RUN pdm config pypi.url https://mirror.baidu.com/pypi/simple

RUN echo deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse > /etc/apt/sources.list
RUN echo deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse >> /etc/apt/sources.list
RUN apt update && upgrade -y

RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential gcc libsndfile1
CMD cd /usr/src/app/ && pdm install && pdm run start
