FROM  openjdk:9-jre-slim
MAINTAINER Armin Pipp <armin@pipp.at>
# 04/2018

RUN mkdir /logstation
WORKDIR /logstation

RUN apt-get update  -y &&  apt-get install -y wget && apt-get clean
RUN wget https://github.com/jdrews/logstation/releases/download/0.3.9/logstation-0.3.9.jar -O /logstation/logstation.jar
RUN java -jar logstation.jar

EXPOSE 8884
CMD  java -jar logstation.jar
