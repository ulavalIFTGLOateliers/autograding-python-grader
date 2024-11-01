FROM python:3.11.2-slim

COPY requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN apt-get update \
 && apt-get install jq -y \
 && apt-get autoremove -y \
 && apt-get install coreutils -y \
 && rm -rf /var/lib/apt/lists/*

ENV PORT=1521
ENV USER=my_user
ENV PASSWORD=password
ENV HOST=localhost
ENV SERVICE_NAME=FREEPDB1

COPY . /opt/test-runner

WORKDIR /opt/test-runner

ENTRYPOINT [ "/opt/test-runner/bin/run.sh" ]
