# Service-1 Helm Chart

Este Helm Chart implementa o serviço service-1 com suporte a múltiplos ambientes.

## Usando o Chart com diferentes ambientes

Este chart suporta três ambientes principais: `dev`, `staging` e `prod`. Cada ambiente possui configurações pré-definidas que podem ser personalizadas.

### Instalação local para testes

Para instalar o chart localmente para um ambiente específico:

```bash
# Ambiente de desenvolvimento
helm install service-1 ./helm -f ./helm/values-dev.yaml

# Ambiente de staging
helm install service-1 ./helm -f ./helm/values-staging.yaml

# Ambiente de produção
helm install service-1 ./helm -f ./helm/values-prod.yaml
```

### Uso com ArgoCD

Para usar este chart com ArgoCD, você pode configurar aplicações separadas para cada ambiente:

#### Exemplo de configuração no ArgoCD:

1. Crie uma aplicação para o ambiente de desenvolvimento:
   - Nome: `service-1-dev`
   - Projeto: `default`
   - Repositório Git: `https://github.com/seu-usuario/service_1.git`
   - Caminho: `helm`
   - Valores: Especifique o arquivo `values-dev.yaml`

2. Repita o processo para staging e produção, ajustando os valores conforme necessário.

#### Exemplo de Application no ArgoCD (YAML):

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: service-1-dev
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/seu-usuario/service_1.git
    targetRevision: HEAD
    path: helm
    helm:
      valueFiles:
        - values-dev.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: service-1-dev
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## Personalizando ambientes

Você pode personalizar qualquer configuração específica de ambiente editando os arquivos `values-{env}.yaml` ou sobrescrevendo valores no momento da instalação/deploy.
