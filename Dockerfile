FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY incidentresponse/ /app/

ENTRYPOINT ["gunicorn"]
CMD ["--bind", "0.0.0.0:8000", "incidentresponse.wsgi"]
