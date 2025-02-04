FROM jenkins/jenkins:lts-jdk17

USER root

# Установка зависимостей
RUN apt-get update && apt-get install -y curl

# Скачивание Docker Compose V1 (версия 1.29.2)
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

USER jenkins
