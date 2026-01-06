#!/bin/bash
# Script to set up and run Jekyll website locally

set -e  # Exit on error

echo "=== Setting up Jekyll website ==="
echo ""

# Step 1: Install system dependencies (requires sudo password)
echo "Step 1: Installing system dependencies..."
echo "You will be prompted for your password."
sudo apt update
sudo apt install -y libyaml-dev libssl-dev libreadline-dev zlib1g-dev libffi-dev build-essential

# Step 2: Set up rbenv
echo ""
echo "Step 2: Setting up Ruby environment..."
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Step 3: Install Ruby 3.2.2
echo ""
echo "Step 3: Installing Ruby 3.2.2 (this may take 5-10 minutes)..."
RUBY_BUILD_HTTP_CLIENT="wget" RUBY_CONFIGURE_OPTS="--disable-install-doc" rbenv install 3.2.2

# Step 4: Set Ruby version
echo ""
echo "Step 4: Setting Ruby version..."
rbenv global 3.2.2
rbenv rehash

# Step 5: Install bundler
echo ""
echo "Step 5: Installing bundler..."
gem install bundler

# Step 6: Install Jekyll dependencies
echo ""
echo "Step 6: Installing Jekyll dependencies..."
cd /home/admin123/weidonghuang.github.io
bundle config set --local path 'vendor/bundle'
bundle install

# Step 7: Start Jekyll server
echo ""
echo "Step 7: Starting Jekyll server..."
echo "The website will be available at http://localhost:4000"
echo "Press Ctrl+C to stop the server"
echo ""
bundle exec jekyll serve --host 0.0.0.0

