#!/usr/bin/env bash

mkdir build/eb

cp Dockerfile build/eb/
cp dockerrun.aws.json build/eb/
cp build/libs/cijug-website-1.0-SNAPSHOT.jar build/eb/webapp.jar

cd build/eb/
zip eb_app.zip *

GIT_HASH=$(git rev-parse HEAD)
TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")
S3_FILENAME=$GIT_HASH-$TIMESTAMP
aws s3 cp eb_app.zip s3://sonnevillejohn/cijug-deployments/$S3_FILENAME.zip
aws elasticbeanstalk create-application-version --application-name cijug-website --version-label $S3_FILENAME --source-bundle S3Bucket=sonnevillejohn,S3Key=cijug-deployments/$S3_FILENAME.zip
aws elasticbeanstalk update-environment --application-name cijug-website --environment-name prod --version-label $S3_FILENAME
