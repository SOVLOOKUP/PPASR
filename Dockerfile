FROM python:3.8

COPY ./* /usr/src/app/
WORKDIR /usr/src/app/

RUN pip install pdm
RUN pdm install
EXPOSE 8190 8191

CMD pdm run start
