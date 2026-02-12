# 🌌 Antigravity Genesis

> **A Fundação da Engenharia Agêntica.**
> Um template de infraestrutura "Agent-First" projetado para transformar o IDE em uma fábrica de software autônoma.

## 🎯 Propósito
Este repositório serve como o "Template Mestre" (Genesis) para novos projetos. Ele configura automaticamente um ambiente blindado e instrumentado para que Agentes de IA (Gemini 3, Claude, etc.) operem com:
1.  **Memória Persistente:** Via sistema [Beads](https://github.com/steveyegge/beads) (Grafo de Tarefas).
2.  **Infraestrutura Imutável:** Via DevContainers com Docker-in-Docker.
3.  **Conectividade Estendida:** Preparado para o Docker MCP Toolkit (Gateway de Ferramentas).

## 🏗️ Arquitetura

O ambiente é composto por três pilares:

* **🛡️ DevContainer (O Corpo):** Um container isolado que previne contaminação do host e garante que todos os agentes tenham as mesmas ferramentas (Node, Python, Git CLI).
* **🧠 Beads & Contexto (O Cérebro):** Estrutura de pastas `.ai-context` e `.beads` para garantir que o agente mantenha o estado do projeto entre sessões.
* **🔌 Docker MCP (Os Braços):** Configuração de rede (`host`) para permitir que o agente acesse ferramentas externas rodando no Docker Desktop.

## 🚀 Como Iniciar

1. **Clone este repositório:**
   ```bash
   git clone [https://github.com/brunosrosa/antigravity-genesis.git](https://github.com/brunosrosa/antigravity-genesis.git)
   ``` 
2.Abra no Antigravity / VS Code: Certifique-se de ter o Docker Desktop rodando.

3. Reopen in Container: Aguarde o script de setup.sh finalizar a configuração do ambiente e a correção dos paths do servidor.

📂 Estrutura de Diretórios
/
├── .devcontainer/    # Definição do Ambiente Isolado
├── .ai-context/      # Memória Estática (Arquitetura, Glossário)
├── .agent/           # Definições de Skills e Rules
├── .beads/           # Banco de Dados de Tarefas (Memória Dinâmica)
└── specs/            # Especificações OpenSpec (Contratos)

Mantido por Bruno Sant'Ana - Engenharia de Agentes 2026