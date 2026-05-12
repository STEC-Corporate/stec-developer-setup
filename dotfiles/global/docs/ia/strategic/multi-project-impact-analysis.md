# 🔄 Análise de Impacto Multi-Projeto

> **Histórico de decisões que afetaram múltiplos projetos da plataforma SoundLink**

---

## 🎯 Contexto dos 5 Projetos

### 1. Template (soundlink-template-frontend)
- **Papel**: Referência de fluxos, telas, specs de API
- **Função**: Direciona o Frontend Oficial (migração por sprint)

### 2. Frontend Oficial (soundlink-frontend)
- **Papel**: App em produção
- **Função**: Recebe código do Template por sprint

### 3. BFF (soundlink-bff)
- **Papel**: Orquestração e adaptação para o frontend
- **Função**: Mapeamento BFF ↔ API

### 4. APIs (soundlink-api)
- **Papel**: Domínio e regras de negócio
- **Função**: Contratos consumidos pelo BFF

### 5. Infrastructure (soundlink-infrastructure)
- **Papel**: Infraestrutura e DevOps
- **Função**: CI/CD, ambientes, deploy, monitoramento

---

## 📋 Decisões que Afetaram Múltiplos Projetos

### Decisão 1: [Nome da Decisão]

**Data**: [Data]

**Descrição**: [Descrição da decisão]

**Projetos Afetados**:
- ✅ Template: [Impacto]
- ✅ Frontend Oficial: [Impacto]
- ✅ BFF: [Impacto]
- ✅ API: [Impacto]
- ✅ Infrastructure: [Impacto]

**Estratégia de Replicação Utilizada**:
1. [Passo 1]
2. [Passo 2]
3. [Passo 3]

**Timeline**: [Tempo real vs estimado]

**Lições Aprendidas**: [Lições]

**Status**: ⏳ Pendente / ✅ Concluído / ❌ Cancelado

---

## 🔄 Estratégias de Replicação Utilizadas

### Padrão 1: Migração por Sprint (Template → Frontend)

**Quando usar**: Features completas implementadas no Template

**Processo**:
1. Implementar no Template
2. Documentar especificações
3. Migrar para Frontend Oficial na sprint seguinte
4. Validar funcionamento

**Exemplos**: [Lista de exemplos]

---

### Padrão 2: Especificações em Cascata (Template → BFF → API)

**Quando usar**: Mudanças em APIs ou contratos

**Processo**:
1. Documentar especificações no Template
2. Implementar orquestração no BFF
3. Implementar domínio na API
4. Validar integração

**Exemplos**: [Lista de exemplos]

---

### Padrão 3: Agents/Skills Compartilhados

**Quando usar**: Novos agents ou skills que podem ser úteis em múltiplos projetos

**Processo**:
1. Criar no Template
2. Documentar uso
3. Copiar para projetos que precisam
4. Adaptar conforme necessário

**Exemplos**: [Lista de exemplos]

---

## 📊 Padrões Identificados

### Padrões de Sucesso

*Análise será preenchida conforme padrões são identificados*

### Padrões de Falha

*Análise será preenchida conforme problemas são identificados*

---

## ⚠️ Riscos Comuns

### Risco 1: Desalinhamento entre Projetos

**Descrição**: Projetos ficam desalinhados quando mudanças não são replicadas

**Mitigação**: 
- Sempre documentar impacto multi-projeto
- Seguir estratégia de replicação definida
- Validar alinhamento periodicamente

---

### Risco 2: Dependências Não Identificadas

**Descrição**: Mudança em um projeto quebra outro não identificado

**Mitigação**:
- Sempre usar skill `validate-multi-project-impact`
- Mapear todas as dependências
- Testar integração após mudanças

---

## 🔄 Processo de Atualização

Este documento deve ser atualizado:
- ✅ Sempre que uma decisão multi-projeto é tomada
- ✅ Após conclusão de estratégia de replicação
- ✅ Quando padrões são identificados
- ✅ Periodicamente (trimestral) para revisão

---

## 📚 Referências

- **Skill de Validação**: `.cursor/skills/validate-multi-project-impact/SKILL.md`
- **Estrutura de Projetos**: `.cursor/docs/ia/README.md`
- **Fluxo de Migração**: `.cursorrules`

---

**Criado em**: 2026-02-08  
**Última atualização**: 2026-02-08  
**Mantenedor**: Strategic Advisor (CEO)
