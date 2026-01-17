#!/bin/bash

# Bootstrap script for setting up a new macOS development environment
# This script installs essential tools and dependencies

set -e

echo "Starting macOS development environment setup..."

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Error: This script is designed for macOS only."
    exit 1
fi

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install essential packages
echo "Installing essential packages..."
brew install \
    git \
    vim \
    wget \
    curl \
    tree \
    htop \
    jq

# Install development tools (optional - uncomment as needed)
# brew install node python3 go rust

echo ""
echo "Bootstrap complete!"
echo "Run './install.sh' to install dotfiles."
