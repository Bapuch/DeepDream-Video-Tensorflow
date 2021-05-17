FROM python:3.8.5


# tensorflow for macos
RUN curl -fLO https://github.com/apple/tensorflow_macos/releases/download/v0.1alpha2/tensorflow_macos-${VERSION}.tar.gz
RUN tar xvzf tensorflow_macos-${VERSION}.tar
RUN cd tensorflow_macos
RUN ./install_venv.sh --prompt

# django env variables
# ENV PYTHONBUFFERED 1
# ENV PYTHONWRITEBYTECODE 1


ENV DEEPDREAM_HOME=/deepdream


# Change the workdir.
WORKDIR $DEEPDREAM_HOME

COPY requirements.txt $DEEPDREAM_HOME
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . $DEEPDREAM_HOME
# RUN chown -R app:app $APP_HOME


# ENTRYPOINT ["/home/app/web/entrypoint.sh"]
# CMD ["uwsgi", "--http", ":8080", "--ini", "./uwsgi/uwsgi.ini"]