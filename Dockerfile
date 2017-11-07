FROM jenkinsci/jnlp-slave:3.10-1
LABEL author="Val Orekhov <vorekhov@withum.com>"

USER root

RUN apt-get -qqy update \
    && apt-get -qqy --no-install-recommends install apt-transport-https
    
# Add Microsoft .Net Core repository
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
  && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list

RUN apt-get -qqy update \
  #&& apt-get -qqy upgrade \  
  && apt-get -qqy --no-install-recommends install dotnet-sdk-2.0.0 \
  && rm -rf /var/lib/apt/lists/*

USER jenkins