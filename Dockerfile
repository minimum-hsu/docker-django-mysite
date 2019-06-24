FROM python:3.7

RUN apt-get update \
  && apt-get install -y \
    mysql-client \
    postgresql-client \
    sqlite3 \
  && rm -fr /var/lib/apt/lists/* \
  && mkdir -p /usr/src/app

WORKDIR /usr/src/app
COPY . /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["python", "manage.py"]

CMD ["runserver", "0.0.0.0:8000"]
