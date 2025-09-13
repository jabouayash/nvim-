#!/bin/bash

# Neovim Dependency Installation Script
# Run this to install all recommended dependencies

echo "🚀 Installing Neovim dependencies..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed. Please install it first:"
    echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

echo "📦 Installing critical dependencies..."

# Critical dependencies
brew install ripgrep fd

echo "📦 Installing Nerd Font..."
# Install JetBrains Mono Nerd Font
brew install --cask font-jetbrains-mono-nerd-font

echo "📦 Installing optional dependencies..."

# Optional but recommended
brew install wget tree-sitter

# Language-specific (install only if you use these languages)
echo "📝 Installing language support..."

# Python support
if command -v python3 &> /dev/null; then
    echo "  Installing Python neovim module..."
    pip3 install pynvim
fi

# Node support
if command -v npm &> /dev/null; then
    echo "  Installing Node neovim module..."
    npm install -g neovim
fi

# Ruby support
if command -v gem &> /dev/null; then
    echo "  Installing Ruby neovim gem..."
    gem install neovim
fi

# Go support (optional - uncomment if you need it)
# echo "  Installing Go..."
# brew install go

echo ""
echo "✅ Installation complete!"
echo ""
echo "⚠️  IMPORTANT: Configure your terminal to use 'JetBrainsMono Nerd Font'"
echo ""
echo "Next steps:"
echo "1. Restart your terminal"
echo "2. Open Neovim: nvim"
echo "3. Run :checkhealth to verify everything is working"
echo ""
echo "If you see ? symbols, make sure your terminal is using the Nerd Font!"