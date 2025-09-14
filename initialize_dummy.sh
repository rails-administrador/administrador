#!/bin/bash

# Delete old dummy app
rm -rf spec/dummy

# Generate new dummy app
CURRENT_DIR=$(pwd)
TEMP_DIR=$(mktemp -d)
cd $TEMP_DIR
rails --version
rails new dummy \
  --skip-git \
  --skip-bundle \
  -T \
  --javascript=importmap
mv dummy $CURRENT_DIR/spec/dummy
cd $CURRENT_DIR
rm -rf $TEMP_DIR

# Abort unless the dummy app was created successfully
if [ ! -d "spec/dummy" ]; then
  echo "Dummy app was not created successfully"
  exit 1
fi

# Proceed in the dummy app
cd spec/dummy

# Remove .ruby-version
rm .ruby-version

# install importmaps
bin/rails importmap:install

# install turbo-rails
bin/rails turbo:install

# Add administrador from local path by appending to Gemfile
cat >> Gemfile << 'EOF'
gem "administrador", path: "../../../"
EOF

# Add rao from local path by appending to Gemfile
cat >> Gemfile << 'EOF'
gem "rao", path: "~/projects/gems/rao"
gem "rao-component", path: "~/projects/gems/rao/rao-component"
gem "rao-query", path: "~/projects/gems/rao/rao-query"
gem "rao-resources_controller", path: "~/projects/gems/rao/rao-resources_controller"
gem "rao-service_controller", path: "~/projects/gems/rao/rao-service_controller"
gem "rao-view_helper", path: "~/projects/gems/rao/rao-view_helper"
EOF

# Add rspec
sed -i '/group :development, :test do/a\\n  gem "rspec-rails"' Gemfile

# Add factory_bot_rails
sed -i '/group :development, :test do/a\\n  gem "factory_bot_rails"' Gemfile

# Install dependencies
bundle install

# Install
rails generate administrador:install

# Setup engines
echo "Setting up engines..."
bash ../../setup_engines.sh

# Setup database
rails db:migrate db:test:prepare