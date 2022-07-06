FROM python:3.8

EXPOSE 8190 8191
COPY ./* /usr/src/app/
WORKDIR /usr/src/app/

RUN pip install pdm

CMD cd /usr/src/app/ && pdm install && pdm run start
