#!/bin/bash
# Setup script for running Jekyll website locally

echo "Setting up Ruby environment..."

# Add rbenv to PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Try to install Ruby (this may require manual intervention)
echo "Installing Ruby 3.2.2 (this may take a few minutes)..."
RUBY_CONFIGURE_OPTS="--disable-install-doc" rbenv install 3.2.2 || {
    echo "Ruby installation failed. Please run manually:"
    echo "  export PATH=\"\$HOME/.rbenv/bin:\$PATH\""
    echo "  eval \"\$(rbenv init -)\""
    echo "  RUBY_CONFIGURE_OPTS=\"--disable-install-doc\" rbenv install 3.2.2"
    echo "  rbenv global 3.2.2"
    exit 1
}

# Set Ruby version
rbenv global 3.2.2
rbenv rehash

# Install bundler
echo "Installing bundler..."
gem install bundler

# Install Jekyll dependencies
echo "Installing Jekyll dependencies..."
bundle install

# Run Jekyll server
echo "Starting Jekyll server..."
bundle exec jekyll serve --host 0.0.0.0
