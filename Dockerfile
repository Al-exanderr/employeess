# pull official base image
FROM python:3.6.9-alpine

# создаем директорию для пользователя
RUN mkdir -p /home/app

# создаем отдельного пользователя
RUN addgroup -S app && adduser -S app -G app

# создание каталога для приложения
ENV HOME=/home/app
ENV APP_HOME=/home/app/web
RUN mkdir $APP_HOME
RUN mkdir $APP_HOME/static
RUN mkdir $APP_HOME/media
WORKDIR $APP_HOME

# install dependencies for Postgre
RUN apk update \
    && apk add libpq postgresql-dev gcc python3-dev musl-dev curl

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# копирование entrypoint-prod.sh
COPY ./entrypoint.prod.sh $APP_HOME

# copy current folder content (project) to container
COPY . $APP_HOME

# изменение прав для пользователя app
RUN chown -R app:app $APP_HOME

# изменение рабочего пользователя
USER app

ENTRYPOINT ["/home/app/web/entrypoint.prod.sh"]

