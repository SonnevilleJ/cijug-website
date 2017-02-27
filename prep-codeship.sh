#!/usr/bin/env bash

# Remove legacy AWS CLI
pip uninstall --yes aws awscli
pip install --upgrade pip awscli

# Default AWS settings
aws configure set default.region us-east-1
