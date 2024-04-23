FROM python:3.8.2-slim-buster
WORKDIR /python_files
ADD requirements.txt requirements.txt

COPY InformationSchemaParser.py .

RUN pip install -r requirements.txt

EXPOSE 5432

CMD ["python3", "InformationSchemaParser.py"]
