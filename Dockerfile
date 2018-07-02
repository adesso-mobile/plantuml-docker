FROM debian:9
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y openjdk-8-jre graphviz gpg
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN echo oracle-java8-installer shared/accepted-oracle-licence-v1-1 boolean true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer oracle-java8-set-default
ADD run.sh /usr/local/bin/
ENV HOME=/tmp
CMD /usr/local/bin/run.sh

