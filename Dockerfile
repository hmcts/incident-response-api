FROM python:3.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    netcat \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY . /app/

ENTRYPOINT ["python", "./incidentresponse/manage.py"]
CMD ["runserver", "0.0.0.0:8000"]
