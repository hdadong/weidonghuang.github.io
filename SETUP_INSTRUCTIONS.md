# Setup Instructions for Running Jekyll Website Locally

This website is built with Jekyll and requires Ruby to run locally. You have two options:

## Option 1: Using Docker (Recommended - Easiest)

If you have Docker installed, this is the simplest method:

```bash
# Install Docker (if not already installed)
sudo apt update
sudo apt install -y docker.io docker-compose

# Add your user to docker group (to run without sudo)
sudo usermod -aG docker $USER
# Then log out and log back in, or run: newgrp docker

# Navigate to the project directory
cd /home/admin123/weidonghuang.github.io

# Pull and run the Docker container
docker compose pull
docker compose up
```

Then open your browser and go to `http://localhost:8080`

## Option 2: Manual Ruby Installation

If you prefer to install Ruby directly:

### Step 1: Install System Dependencies

```bash
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential libssl-dev libreadline-dev zlib1g-dev libffi-dev
```

### Step 2: Install Ruby using rbenv (already installed)

```bash
# Set up rbenv in your shell
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Install Ruby 3.2.2
RUBY_BUILD_HTTP_CLIENT="wget" RUBY_CONFIGURE_OPTS="--disable-install-doc" rbenv install 3.2.2

# Set Ruby version
rbenv global 3.2.2
rbenv rehash
```

### Step 3: Install Bundler and Dependencies

```bash
# Navigate to project directory
cd /home/admin123/weidonghuang.github.io

# Install bundler
gem install bundler

# Install Jekyll and all dependencies
bundle install
```

### Step 4: Run the Jekyll Server

```bash
bundle exec jekyll serve --host 0.0.0.0
```

Then open your browser and go to `http://localhost:4000`

## Quick Start (After Setup)

Once everything is installed, you can start the server with:

**Using Docker:**
```bash
cd /home/admin123/weidonghuang.github.io
docker compose up
```

**Using Ruby directly:**
```bash
cd /home/admin123/weidonghuang.github.io
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
bundle exec jekyll serve --host 0.0.0.0
```

## Troubleshooting

- If you get permission errors, make sure you've installed all system dependencies
- If Jekyll fails to start, try running `bundle install` again
- For Docker issues, make sure Docker is running: `sudo systemctl start docker`

