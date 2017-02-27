# CIJUG Website

Welcome to the code repository for the website of the Central Iowa Java Users Group! In addition to hosting the website of the user group, we hope this code repository can serve as an example for how to use some of the most common technologies in the Java ecosystem today.

## Code Repository - GitHub

[GitHub](https://www.github.com/) provides free hosting for public repositories. There are also many features of GitHub which are useful for open source projects or any project with more than one developer.

## Build Tool - Gradle

We use [Gradle](https://gradle.org/) to manage dependencies and build the project into an executable jar. Other popular alternatives are [Maven](https://maven.apache.org/) and [Ant](https://ant.apache.org/) although Ant is considered by many to be obsolete.

The project repository includes the [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html) which allows developers to use Gradle without having to install it on their machine. The Gradle `build` task will perform compilation and run any unit tests. To execute the `build` task, run the following on a command line:
* `gradlew clean build` (Windows)
* `./gradlew clean build` (Linux/Mac)

## Web Server - Spring Boot

The CIJUG website is hosted by a [Spring Boot](https://projects.spring.io/spring-boot/) application. This is a simple Java application with an embedded Jetty server which hosts both a web API - see [Hello Controller](https://github.com/SonnevilleJ/cijug-website/blob/master/src/main/java/com/cijug/website/HelloController.java) - as well as static content - see [static.html](https://github.com/SonnevilleJ/cijug-website/blob/master/src/main/resources/static/static.html).

## Hosting - Amazon Web Services

The CIJUG website is an [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) app which offers managed, redundant hosting across multiple datacenters, versioning of deployments, log management, application metrics, and alerting. These services are offered at no charge beyond the basic fee to run the virtual server.

To simplify the deployment to Elastic Beanstalk, we use [Docker](https://www.docker.com/) to package the app and any dependencies. This has an added benefit of guaranteeing there are no differences between a production environment and a developer's machine.

## Continuous Integration - Codeship

This project achieves continuous integration and continuous delivery for free by using [Codeship](https://codeship.com/). This offers a convenient place to keep AWS keys private while also executing tests and deployment scripts.

Current build status: ![current build status](https://app.codeship.com/projects/68fe7500-dd6b-0134-9492-6a1dce034df0/status?branch=master) This status image will turn green if the continuous integration build is currently passing. If the build is broken, the status image will be red. 

There are only two custom scripts configured in the Codeship project - *that's it* - everything else is included as part of this repository.

#### Test
```bash
./prep-codeship.sh
jdk_switcher use oraclejdk8 # tell Codeship to use Java 8
./gradlew clean build
```

#### Deployment
```bash
aws configure set aws_access_key_id {private}
aws configure set aws_secret_access_key {private}
./eb-deploy.sh
```
