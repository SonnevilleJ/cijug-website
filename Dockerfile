FROM java:latest

MAINTAINER John Sonneville <SonnevilleJ@gmail.com>

COPY * /opt/cijug-website/

EXPOSE 80

CMD ["java", "-jar", "/opt/cijug-website/webapp.jar"]
