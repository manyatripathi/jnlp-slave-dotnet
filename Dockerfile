FROM jenkinsci/jnlp-slave:3.10-1
MAINTAINER Val Orekhov <vorekhov@withum.com>

USER root

# Add Microsoft .Net Core repository
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list

RUN apt -qqy update \
  && apt -qqy upgrade \
  && apt -qqy --no-install-recommends install dotnet-sdk-2.0.0 \
  && rm -rf /var/lib/apt/lists/*

USER jenkins