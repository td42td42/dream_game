#!/usr/bin/env bash
set -e

echo "🚀 Verifying and initializing dream_game workspace..."

# 1. Self-healing Git repository initialization
if [ ! -d ".git" ]; then
  echo "📦 Initializing local Git repository..."
  git init
  
  # Create standard .gitignore if missing
  if [ ! -f ".gitignore" ]; then
    echo "node_modules/" > .gitignore
    echo "dist/" >> .gitignore
    echo ".env" >> .gitignore
  fi
else
  echo "✅ Git repository already initialized."
fi

# 2. Initialize root package.json & workspaces if missing
if [ ! -f "package.json" ]; then
  echo "📝 Creating initial package.json..."
  npm init -y
fi

# Ensure workspace configuration is enforced
npm pkg set private=true workspaces[]="packages/*"

# 3. Install workspace-level tooling only if missing from package.json
if ! grep -q "eslint" package.json; then
  echo "📦 Installing ESLint and TypeScript dev tools..."
  npm install -D eslint @eslint/js typescript typescript-eslint
else
  echo "✅ Dev tools already registered in package.json."
fi

# 4. Install dependencies if node_modules is missing
if [ ! -d "node_modules" ]; then
  echo "📦 Installing dependencies..."
  npm install
else
  echo "✅ node_modules already exists. Skipping full install."
fi

echo "🎉 Workspace is completely configured and up to date!"
