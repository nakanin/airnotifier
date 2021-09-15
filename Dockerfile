FROM python:3

RUN pip install pipenv

RUN git clone -b master git://github.com/airnotifier/airnotifier.git airnotifier
WORKDIR /airnotifier

RUN pipenv install --deploy

COPY config.py .

# RUN pipenv run ./install.py 
# 上記は mongodb に接続する必要があるため、初回起動後に手動で実施する
# 例）
# docker-compose exec airnotifier bash
# pipenv run ./install.py

CMD [ "pipenv", "run", "./app.py" ]
