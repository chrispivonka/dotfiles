" Vim Configuration

" General settings
set nocompatible              " Use Vim settings, rather than Vi
set backspace=indent,eol,start " Allow backspacing over everything
set history=1000              " Keep 1000 lines of command line history
set ruler                     " Show cursor position
set showcmd                   " Display incomplete commands
set incsearch                 " Do incremental searching
set number                    " Show line numbers
set relativenumber            " Show relative line numbers

" Indentation
set autoindent                " Auto indent
set smartindent               " Smart indent
set tabstop=4                 " Number of spaces per tab
set shiftwidth=4              " Number of spaces for autoindent
set expandtab                 " Convert tabs to spaces

" UI
set showmatch                 " Show matching brackets
set hlsearch                  " Highlight search results
syntax on                     " Enable syntax highlighting
set background=dark           " Dark background

" File handling
set autoread                  " Auto reload files changed outside vim
set encoding=utf-8            " Use UTF-8 encoding

" Disable backup files
set nobackup
set nowritebackup
set noswapfile

" Enable mouse support
set mouse=a

" Status line
set laststatus=2              " Always show status line
set statusline=%F%m%r%h%w\ [%l/%L,%c]\ [%p%%]
