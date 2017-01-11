#! /usr/bin/env bash

set -e

cd $SEMAPHORE_PROJECT_DIR/dir1

echo "Installing dependencies of dir1"
echo "----------------------------------------------------"
bundle install
bundle exec rake db:setup db:test:prepare

echo "Running tests for dir1"
echo "----------------------------------------------------"
bundle exec rake rspec
