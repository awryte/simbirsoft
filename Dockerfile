FROM centos
ENV APP_PATH="/opt/Flaskex"

RUN mkdir $APP_PATH

COPY media $APP_PATH/media
COPY scripts $APP_PATH/scripts
COPY static $APP_PATH/static
COPY templates $APP_PATH/templates
# COPY Procfile accounts.db app.py requirements.txt runtime.txt $APP_PATH/
COPY Procfile accounts.db app.py runtime.txt $APP_PATH/

RUN yum install -y python3 \
  && pip3 install Flask WTForms SQLAlchemy bcrypt requests flask-heroku gunicorn
# RUN pip install -r requirements.txt

EXPOSE 5000

WORKDIR $APP_PATH

CMD ["python3", "app.py"]
