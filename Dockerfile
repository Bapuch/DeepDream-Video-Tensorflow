FROM python:3.8.5


# tensorflow for macos

RUN curl -fLO https://github.com/apple/tensorflow_macos/releases/download/v0.1alpha3/tensorflow_macos-0.1alpha3.tar.gz
# RUN tar xvzf tensorflow_macos-0.1alpha3.tar
RUN unzip tensorflow_macos-0.1alpha3.tar.gz
RUN ./tensorflow_macos/install_venv.sh --prompt
# RUN ./install_venv.sh --prompt

# django env variables
# ENV PYTHONBUFFERED 1
# ENV PYTHONWRITEBYTECODE 1
ENV DEEPDREAM_HOME=/deepdream
# RUN mkdir $DEEPDREAM_HOME


# Change the workdir.
WORKDIR $DEEPDREAM_HOME

# COPY requirements.txt $DEEPDREAM_HOME
# RUN pip install --upgrade pip
# RUN pip install -r requirements.txt

COPY ./deepdream_video/ $DEEPDREAM_HOME
# RUN chown -R app:app $APP_HOME


# ENTRYPOINT ["/home/app/web/entrypoint.sh"]
# CMD ["uwsgi", "--http", ":8080", "--ini", "./uwsgi/uwsgi.ini"]