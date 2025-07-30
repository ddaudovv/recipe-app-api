FROM python:3.9-alpine
LABEL maintainer="Python App Developer"

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Copy dependency list
COPY ./requirements.txt /requirements.txt

# Install dependencies
RUN pip install -r /requirements.txt

# Create app directory and set it as working directory
RUN mkdir /app
WORKDIR /app

# Copy app source code
COPY ./app /app

# Add non-root user and switch to it
RUN adduser -D user
USER user