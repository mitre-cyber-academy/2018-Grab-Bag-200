FROM python:3.6

WORKDIR /usr/src/app

COPY gasServer.py .

CMD ["python", "gasServer.py"]
EXPOSE 8080

