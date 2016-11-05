#Specify the image source
FROM ubuntu:latest

#Update the ubuntu repository and install softwares
RUN apt-get update &&\
apt-get install -y python-software-properties default-jre wget

#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get update

#RUN apt-get install -y oracle-java8-installer

RUN cd /tmp && wget http://apache.claz.org/lucene/solr/6.2.1/solr-6.2.1.tgz &&\
tar xzf /tmp/solr-6.2.1.tgz solr-6.2.1/bin/install_solr_service.sh --strip-components=2

RUN /tmp/install_solr_service.sh /tmp/solr-6.2.1.tgz

#Keep the linux container running
ENTRYPOINT service solr start && while true; do sleep 1000; done

#Port to connect to SonarQube
EXPOSE 8983
