# Service 1

Um serviço em Go que pode ser implantado com ArgoCD.

## CI/CD Workflow

Este projeto utiliza GitHub Actions para automatizar o processo de build, versionamento e publicação da imagem Docker.

### Processo de CI/CD

1. **Build**: O código Go é compilado
2. **Testes**: Os testes unitários são executados
3. **Versionamento**: Uma versão é gerada com base em:
   - Tag (se disponível): v1.0.0
   - Commit hash + timestamp (para branches): abcdef-20230615123456
4. **Docker**: A imagem Docker é construída
5. **Publicação**: A imagem é publicada no GitHub Container Registry (ghcr.io)

### Tags das imagens

As imagens são publicadas com as seguintes tags:
- Tag da versão semântica (ex: `v1.0.0`)
- Nome da branch (ex: `main`)
- Hash curto do commit (ex: `sha-abc123`)

### Exemplos de uso

Você pode referenciar as imagens em seu Kubernetes ou docker-compose:

```yaml
image: ghcr.io/seu-usuario/service_1:v1.0.0
```

## Deployando com Helm e ArgoCD

O projeto inclui um Helm chart com suporte a múltiplos ambientes. Veja a documentação do chart [aqui](./helm/README.md).
