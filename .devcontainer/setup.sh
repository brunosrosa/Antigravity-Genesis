#!/bin/bash
set -e

echo "🔧 [Genesis] Iniciando configuração..."

# 1. FIX: Caminhos do Antigravity Server (Para não dar erro WebSocket)
SERVER_BIN="$HOME/.antigravity-server/bin"
if [ -d "$SERVER_BIN" ]; then
    cd "$SERVER_BIN"
    for dir in 1.16.5-*; do
        if [ -d "$dir" ]; then
            target="${dir#1.16.5-}"
            if [ ! -L "$target" ]; then
                ln -s "$dir" "$target"
                echo "Link criado: $target"
            fi
        fi
    done
    cd - > /dev/null
fi

# 2. Instalação do Beads (Sua memória)
if ! command -v bd &> /dev/null; then
    sudo npm install -g @beads/bd
fi

if [ ! -d ".beads" ]; then
    bd init --stealth
fi

# 3. Estrutura de Pastas
mkdir -p .ai-context
mkdir -p .agent/skills
mkdir -p docs/adr
mkdir -p specs

echo "✅ [Genesis] Ambiente Pronto."