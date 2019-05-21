FROM jcdemo/flaskapp
MAINTAINER Samarth

USER root

RUN pip install pymongo
RUN rm -rf /src/*
COPY . /src/

EXPOSE 5000

ENTRYPOINT ["/usr/local/bin/python"]
CMD ["/src/sam-library.py"]
 
