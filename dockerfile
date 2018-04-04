FROM python:2.7

WORKDIR /usr/src/app

COPY gasServer.py .

CMD ["python", "gasServer.py"]
EXPOSE 8080

