FROM python:3.11.3

LABEL maintainer="ELOTECH IT LTD <elotechit@gmail.com>"

# tell python to write to standard output and make all errors visible in the container's logs for debugging and troubleshooting
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

# download and run the requirements
RUN pip install -r /requirements.txt

# create an empty directory to store the app source code
RUN mkdir /app
WORKDIR /app
COPY ./app /app/

# create a user that will be run the docker application
RUN adduser --disabled-password user

USER user