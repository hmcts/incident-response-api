FROM python:3.12-slim

WORKDIR /app
COPY requirements.txt /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY incidentresponse/ /app/

ENTRYPOINT ["gunicorn"]
CMD ["--bind", "0.0.0.0:8000", "incidentresponse.wsgi"]
