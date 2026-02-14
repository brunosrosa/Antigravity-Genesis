# Usamos Debian Bullseye completo (não-slim) para máxima compatibilidade
FROM mcr.microsoft.com/devcontainers/base:bullseye

# --- CAMADA DE CORREÇÃO DE INFRA (A "Vacina") ---
# Instala explicitamente libc-bin (que tem o ldd), procps e ferramentas de rede.
# Isso resolve o Erro 127 e falhas de conexão do túnel.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    libc-bin \
    procps \
    net-tools \
    git \
    curl \
    wget \
    iputils-ping \
    dnsutils \
    build-essential \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# --- CAMADA AGÊNTICA (BEADS) ---
# Pré-instala Node.js 20 (se não vier na base) e o Beads
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g @beads/bd

# --- AJUSTES FINAIS ---
# Garante que o diretório de trabalho tenha permissões corretas
WORKDIR /workspaces/antigravity-genesis