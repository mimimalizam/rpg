#! /usr/bin/env bash

set -e

cd $SEMAPHORE_PROJECT_DIR/dir2

echo "----------------------------------------------------"
echo "Installing dependencies of dir2"
echo "----------------------------------------------------"
bundle install
bundle exec rake db:setup db:test:prepare

echo "----------------------------------------------------"
echo "Running tests for dir2"
echo "----------------------------------------------------"

bundle exec rake rspec
