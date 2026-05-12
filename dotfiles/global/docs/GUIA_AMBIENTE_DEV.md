# 🚀 Guia do Ambiente de Desenvolvimento - SoundLink

## 📋 Respostas às Suas Perguntas

### ✅ 1. É possível criar apenas o ambiente de dev?

**SIM!** O projeto está estruturado para permitir a criação isolada do ambiente de desenvolvimento. Cada ambiente (dev/staging/prod) possui suas próprias configurações e pode ser gerenciado independentemente.

### ✅ 2. Qual é o procedimento para testar apenas em Dev?

Siga os passos detalhados na seção [Procedimentos de Deploy](#procedimentos-de-deploy) abaixo.

### ✅ 3. Terá algum custo na AWS para realizar esta operação?

**SIM**, mas otimizamos a configuração para **custos mínimos**. Veja a seção [Estimativa de Custos](#estimativa-de-custos) para detalhes.

### ✅ 4. É possível remover depois do teste?

**SIM!** O Terraform permite destruir toda a infraestrutura com um único comando. Veja a seção [Remoção da Infraestrutura](#remoção-da-infraestrutura).

### ✅ 5. Teria mais algum custo para remover a estrutura?

**NÃO**, a remoção da infraestrutura é gratuita. Na verdade, você **para de pagar** pelos recursos assim que eles são removidos.

---

## 💰 Estimativa de Custos (Ambiente Dev - Otimizado)

### 📊 Custos Mensais Estimados (USD)

| Recurso | Configuração | Custo Mensal | Custo Diário |
|---------|-------------|--------------|--------------|
| **EKS Cluster** | Control Plane | $73.00 | $2.40 |
| **EC2 Instances** | 1x t3.small SPOT (50% do tempo) | $7.50 | $0.25 |
| **NAT Gateway** | 1x NAT Gateway | $32.85 | $1.10 |
| **DocumentDB MongoDB** | 2x db.t3.medium | $89.28 | $2.98 |
| **EBS Volumes** | 60GB gp3 total | $4.80 | $0.16 |
| **ECR** | 5GB de imagens | $0.50 | $0.02 |
| **CloudWatch Logs** | 1GB/mês | $0.50 | $0.02 |
| **VPC/Networking** | Data Transfer | $5.00 | $0.17 |

### 💡 **TOTAL ESTIMADO**
- **Mensal**: ~$148.11 USD (~R$ 740)
- **Diário**: ~$4.95 USD (~R$ 25)
- **Por Hora**: ~$0.21 USD (~R$ 1,05)

### 🎯 **Estratégias para Redução de Custos**

1. **Instâncias SPOT**: Economize até 90% nos nodes EKS
2. **Auto-shutdown**: Configure parada automática fora do horário comercial
3. **Recursos mínimos**: Configuração otimizada para desenvolvimento
4. **Retenção baixa**: Logs e backups com retenção mínima

---

## 🛠️ Procedimentos de Deploy

### 1️⃣ **Pré-requisitos**

```bash
# Verificar se tem as ferramentas instaladas
terraform --version  # >= 1.5.0
aws --version        # >= 2.0
kubectl version      # >= 1.28
```

### 2️⃣ **Configuração AWS**

```bash
# Configure suas credenciais AWS
aws configure

# Ou use variáveis de ambiente
export AWS_ACCESS_KEY_ID="sua-access-key"
export AWS_SECRET_ACCESS_KEY="sua-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
```

### 3️⃣ **Deploy do Ambiente Dev**

```bash
# 1. Clone e navegue para o diretório
cd soundlink-infrastructure

# 2. Inicialize o Terraform
terraform init

# 3. Selecione o workspace de desenvolvimento
terraform workspace new dev 2>/dev/null || terraform workspace select dev

# 4. Valide a configuração
terraform validate

# 5. Planeje o deploy (revisar recursos que serão criados)
terraform plan -var-file="environments/dev/terraform.tfvars" -out=dev.tfplan

# 6. Aplique o plano (CRIARÁ OS RECURSOS NA AWS)
terraform apply dev.tfplan
```

### 4️⃣ **Configuração do kubectl**

```bash
# Configure acesso ao cluster EKS
aws eks update-kubeconfig --region us-east-1 --name soundlink-dev-cluster

# Verifique a conexão
kubectl get nodes
kubectl get namespaces
```

### 5️⃣ **Verificação da Infraestrutura**

```bash
# Verificar recursos criados
terraform show

# Verificar outputs importantes
terraform output

# Verificar cluster EKS
kubectl cluster-info
kubectl get all --all-namespaces
```

---

## 🧪 Procedimentos de Teste

### 1️⃣ **Testes de Conectividade**

```bash
# Teste conexão com banco de dados
kubectl run mongodb-test --rm -i --tty --image mongo:5.0 --restart=Never -- \
  mongo --host <DOCDB_ENDPOINT>:27017 --username auth_user --password --ssl --sslCAFile rds-combined-ca-bundle.pem --sslAllowInvalidHostnames soundlink_auth_dev

# Teste acesso ao Grafana
kubectl port-forward -n monitoring svc/prometheus-stack-grafana 3000:80
# Acesse: http://localhost:3000
```

### 2️⃣ **Deploy de Aplicações de Teste**

```bash
# Deploy de uma aplicação simples para teste
kubectl create deployment nginx-test --image=nginx
kubectl expose deployment nginx-test --port=80 --type=LoadBalancer

# Verificar se está funcionando
kubectl get services
```

### 3️⃣ **Monitoramento**

```bash
# Verificar métricas do cluster
kubectl top nodes
kubectl top pods --all-namespaces

# Acessar Prometheus
kubectl port-forward -n monitoring svc/prometheus-stack-prometheus 9090:9090
# Acesse: http://localhost:9090
```

---

## 🗑️ Remoção da Infraestrutura

### ⚠️ **ATENÇÃO**: Esta operação é **IRREVERSÍVEL**

### 1️⃣ **Preparação para Remoção**

```bash
# 1. Faça backup de dados importantes (se houver)
kubectl get configmaps --all-namespaces -o yaml > configmaps-backup.yaml
kubectl get secrets --all-namespaces -o yaml > secrets-backup.yaml

# 2. Remova aplicações que criaram recursos externos
kubectl delete all --all --all-namespaces
```

### 2️⃣ **Destruição via Terraform**

```bash
# 1. Navegue para o diretório do projeto
cd soundlink-infrastructure

# 2. Selecione o workspace dev
terraform workspace select dev

# 3. Planeje a destruição (revisar o que será removido)
terraform plan -destroy -var-file="environments/dev/terraform.tfvars" -out=destroy.tfplan

# 4. Execute a destruição
terraform apply destroy.tfplan

# 5. Confirme que tudo foi removido
terraform show
```

### 3️⃣ **Limpeza Manual (se necessário)**

```bash
# Verificar se restaram recursos não gerenciados pelo Terraform
aws ec2 describe-instances --filters "Name=tag:Environment,Values=dev"
aws docdb describe-db-clusters
aws eks list-clusters

# Remover workspace do Terraform
terraform workspace select default
terraform workspace delete dev
```

---

## 📈 Cronograma de Custos

### 🕐 **Uso Esporádico (8h/dia, 5 dias/semana)**
- **Custo Mensal**: ~$65 USD (~R$ 325)
- **Economia**: 56% em relação ao uso contínuo

### 🕒 **Uso de Desenvolvimento (12h/dia, 6 dias/semana)**
- **Custo Mensal**: ~$105 USD (~R$ 525)  
- **Economia**: 29% em relação ao uso contínuo

### 💡 **Script de Auto-Shutdown**

```bash
#!/bin/bash
# auto-shutdown.sh - Automatizar parada fora do horário comercial

# Parar nodes EKS (escalar para 0)
aws eks update-nodegroup-config \
  --cluster-name soundlink-dev-cluster \
  --nodegroup-name dev-nodes \
  --scaling-config minSize=0,maxSize=0,desiredSize=0

  # Parar clusters DocumentDB
  aws docdb stop-db-cluster --db-cluster-identifier soundlink-dev-auth-db
  aws docdb stop-db-cluster --db-cluster-identifier soundlink-dev-coverage-db
```

---

## 🚨 Alertas de Custo

### 1️⃣ **Configurar Billing Alerts**

```bash
# Criar alerta de billing via AWS CLI
aws budgets create-budget \
  --account-id $(aws sts get-caller-identity --query Account --output text) \
  --budget '{
    "BudgetName": "SoundLink-Dev-Budget",
    "BudgetLimit": {
      "Amount": "200",
      "Unit": "USD"
    },
    "TimeUnit": "MONTHLY",
    "BudgetType": "COST"
  }'
```

### 2️⃣ **Monitoramento Diário**

```bash
# Script para verificar custos diários
aws ce get-cost-and-usage \
  --time-period Start=2024-01-01,End=2024-01-31 \
  --granularity DAILY \
  --metrics BlendedCost \
  --group-by Type=DIMENSION,Key=SERVICE
```

---

## 📞 Suporte e Troubleshooting

### 🔧 **Problemas Comuns**

1. **Quota Limits**: Verificar limites de serviço da AWS
2. **Credenciais**: Validar permissões IAM
3. **Networking**: Verificar Security Groups e NACLs
4. **Storage**: Monitorar uso de EBS e EFS

### 📧 **Contato**

- **Documentação**: Ver `docs/` para guias detalhados
- **Issues**: Usar GitHub Issues para suporte
- **Logs**: Verificar CloudWatch Logs em caso de problemas

---

## ✅ Checklist Final

### Antes do Deploy:
- [ ] Credenciais AWS configuradas
- [ ] Terraform inicializado
- [ ] Configurações revisadas
- [ ] Limites de billing configurados

### Após o Deploy:
- [ ] Cluster EKS funcionando
- [ ] Databases conectáveis
- [ ] Monitoring operacional
- [ ] Aplicações de teste deployadas

### Antes da Remoção:
- [ ] Dados importantes salvos
- [ ] Recursos externos removidos
- [ ] Confirmação de que não há dependências
- [ ] Backup das configurações importantes

---

**💡 Dica Final**: Use tags consistentes em todos os recursos para facilitar o rastreamento de custos e a organização da infraestrutura! 