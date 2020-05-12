FROM python:3.7
MAINTAINER Abhinil
WORKDIR /calculator
ADD . /calculator
EXPOSE 4000
CMD ["python","calc.py"]
