# dotfiles

Personal macOS dotfiles and development environment setup scripts.

## Overview

This repository contains configuration files (dotfiles) and scripts to quickly set up a new macOS development environment with personalized settings for shell, git, vim, and more.

## What's Included

### Dotfiles

- **`.zshrc`** - ZSH shell configuration (macOS default shell since Catalina)
- **`.bashrc`** - Bash shell configuration
- **`.gitconfig`** - Git configuration with useful aliases
- **`.gitignore_global`** - Global gitignore patterns for macOS and common tools
- **`.vimrc`** - Vim editor configuration

### Scripts

- **`bootstrap.sh`** - Installs Homebrew and essential development tools
- **`install.sh`** - Creates symlinks from your home directory to the dotfiles in this repo

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/chrispivonka/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

**Note:** If you want to use this as a template for your own dotfiles:
1. Fork this repository on GitHub
2. Clone your fork instead: `git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles`
3. Customize the dotfiles to your preferences

### 2. Bootstrap Your Environment (Optional)

If you're setting up a new Mac, run the bootstrap script to install Homebrew and essential tools:

```bash
./bootstrap.sh
```

This will install:
- Homebrew (package manager)
- git, vim, wget, curl, tree, htop, jq

### 3. Install Dotfiles

Run the install script to symlink the dotfiles to your home directory:

```bash
./install.sh
```

This will:
- Create backups of existing dotfiles in `~/.dotfiles_backup/`
- Create symlinks from your home directory to the dotfiles in this repo

### 4. Configure Git

Update your Git configuration with your personal information:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 5. Restart Your Shell

```bash
# For ZSH (macOS default)
source ~/.zshrc

# For Bash
source ~/.bashrc
```

## Customization

Feel free to fork this repository and customize the dotfiles to your preferences. The configuration files are well-commented to help you understand what each setting does.

### Adding More Dotfiles

1. Add your dotfile to this repository
2. Update `install.sh` to include the new dotfile
3. Run `./install.sh` again

### Adding More Tools

Edit `bootstrap.sh` to add more packages or tools you commonly use.

## Features

### Shell Features

- Command history configuration
- Colorized output for ls and other commands
- Git branch display in prompt
- Useful aliases for common commands
- Homebrew support for both Intel and Apple Silicon Macs

### Git Aliases

- `git st` - status
- `git co` - checkout
- `git br` - branch
- `git ci` - commit
- `git lg` - beautiful log graph

### Vim Configuration

- Line numbers (both absolute and relative)
- Syntax highlighting
- Smart indentation
- No backup/swap files
- Mouse support

## Uninstall

If you want to remove the symlinks and restore your original dotfiles:

```bash
# Remove symlinks
rm ~/.zshrc ~/.bashrc ~/.gitconfig ~/.gitignore_global ~/.vimrc

# Restore from backups (if you have them)
# Backups are stored in ~/.dotfiles_backup/
```

## Requirements

- macOS (tested on recent versions)
- Git (comes pre-installed on macOS)

## License

Feel free to use and modify these dotfiles for your own setup.