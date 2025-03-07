FROM python:3.12.9-slim

WORKDIR /workspace
COPY requirements.txt /workspace
RUN pip install -r /workspace/requirements.txt
COPY . .

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
EXPOSE $BACKEND_PORT

CMD exec uvicorn --port $BACKEND_PORT --host 0.0.0.0 main:app --reload