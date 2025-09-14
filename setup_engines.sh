#!/bin/bash

# This script sets up the custom engines for the dummy app
# It should be called from initialize_dummy.sh after the dummy app is created

echo "Setting up custom engines..."

# Create engines directory and copy engines directly from source
echo "Creating engines directory and copying engines..."
mkdir -p engines

# Copy engines directly from the source directory
if [ -d "../../spec/setup/engines" ]; then
  cp -r ../../spec/setup/engines/* engines/
else
  echo "Error: ../../spec/setup/engines directory not found!"
  echo "Current directory: $(pwd)"
  echo "Contents of ../../spec/setup:"
  ls -la ../../spec/setup/ 2>/dev/null || echo "../../spec/setup directory not found"
  exit 1
fi

# Add local gems to Gemfile
echo "Adding local gems to Gemfile..."
cat >> Gemfile << 'EOF'

# Local test engines
gem 'blorgh', path: './engines/blorgh'
gem 'news', path: './engines/news'
gem 'news-backend', path: './engines/news-backend'
EOF

# Add the engines to the administador initializer before the last 'end' statement
echo "Adding engines to administador initializer..."
# Use a here document to properly handle multiline content
sed -i '/^end$/i\
  config.register_engine "Blorgh::Engine", {}\
  config.register_engine "News::Engine", {}\
  config.register_engine "News::Backend::Engine", {}' config/initializers/administador.rb

# Add load paths to the application.rb file
echo "Adding load paths to application.rb..."
cat >> config/application.rb << 'EOF'
$LOAD_PATH << Rails.root.join('engines', 'blorgh', 'lib')
$LOAD_PATH << Rails.root.join('engines', 'news', 'lib')
$LOAD_PATH << Rails.root.join('engines', 'news-backend', 'lib')

require 'blorgh'
require 'news'
require 'news-backend'
EOF

# Add engine routes to the routes file before the last 'end' statement
sed -i '/^end$/i\  mount Blorgh::Engine, at: "/blorgh"\n  mount News::Engine, at: "/news"\n  mount News::Backend::Engine, at: "/news-backend"' config/routes.rb

# install migrations
echo "Installing migrations..."
bin/rails railties:install:migrations


echo "Engines setup complete!"
echo "Run 'bundle install' to install the local gems."

