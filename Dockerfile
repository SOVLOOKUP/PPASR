FROM python:3.8

EXPOSE 8190 8191
COPY ./** /usr/src/app/
WORKDIR /usr/src/app/

RUN pip install pdm
RUN pdm config pypi.url https://mirror.baidu.com/pypi/simple

CMD cd /usr/src/app/ && pdm install && pdm run start
