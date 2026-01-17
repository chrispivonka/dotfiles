#!/bin/bash

# Install script for dotfiles
# This script creates symlinks from the home directory to dotfiles in this repo

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Creating backup directory at $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
fi

# Function to create symlink with backup
link_file() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ -L "$dest" ]; then
            # If it's already a symlink
            local current_src=$(readlink "$dest")
            if [ "$current_src" == "$src" ]; then
                echo "✓ $dest already linked correctly"
                return
            fi
        fi
        
        # Backup existing file
        echo "Backing up existing file: $dest"
        mv "$dest" "$BACKUP_DIR/$(basename "$dest").$(date +%Y%m%d_%H%M%S)"
    fi
    
    # Create symlink
    echo "Creating symlink: $dest -> $src"
    ln -s "$src" "$dest"
}

# Install dotfiles
echo ""
echo "Installing dotfiles..."
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"
link_file "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"

echo ""
echo "✓ Dotfiles installation complete!"
echo ""
echo "Note: Remember to update .gitconfig with your name and email:"
echo "  git config --global user.name 'Your Name'"
echo "  git config --global user.email 'your.email@example.com'"
echo ""
echo "Restart your shell or run 'source ~/.zshrc' (or ~/.bashrc) to apply changes."
