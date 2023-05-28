FROM python:3.8

EXPOSE 8190 8191
COPY . /usr/src/app/
WORKDIR /usr/src/app/

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN pip install pdm
RUN pdm config pypi.url https://mirror.baidu.com/pypi/simple
RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential gcc libsndfile1
CMD cd /usr/src/app/ && pdm install && pdm run start
