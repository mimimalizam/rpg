#! /usr/bin/env bash

set -e

cd $SEMAPHORE_PROJECT_DIR/dir1

echo "----------------------------------------------------"
echo "Installing dependencies of dir1"
echo "----------------------------------------------------"
bundle install
bundle exec rake db:setup db:test:prepare

echo "----------------------------------------------------"
echo "Running tests for dir1"
echo "----------------------------------------------------"
bundle exec rake rspec

echo "----------------------------------------------------"
echo "Finished testing in dir1"
echo "----------------------------------------------------"
