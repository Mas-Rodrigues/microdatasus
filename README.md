# Projeto MicrodataSUS - Análise de Dengue

Este projeto utiliza o pacote `microdatasus` para extrair e processar dados de dengue do SINAN (Sistema de Informação de Agravos de Notificação) do DataSUS.

## 📋 Descrição

O projeto extrai dados de casos de dengue do estado de São Paulo para o ano de 2025, processa as informações e filtra os dados por município específico. É uma ferramenta útil para análise epidemiológica e estudos de saúde pública.

## 🔧 Tecnologias Utilizadas

- **R** (versão 4.4.2)
- **tidyverse** - Conjunto de pacotes para manipulação e visualização de dados
- **microdatasus** - Pacote para download e processamento de microdados do DataSUS
- **janitor** - Limpeza e padronização de nomes de variáveis
- **renv** - Gerenciamento de dependências do projeto

## 📦 Estrutura do Projeto

```
microdatasus/
├── extract.R           # Script principal de extração e processamento
├── README.md          # Documentação do projeto
├── microdatasus.Rproj # Arquivo de projeto RStudio
├── renv.lock          # Arquivo de lock de dependências
└── renv/              # Diretório de gerenciamento de pacotes
```

## 🚀 Como Usar

### Pré-requisitos

- R versão 4.4.2 ou superior
- RStudio (recomendado)
- Conexão com a internet para download dos dados

### Instalação

1. Clone ou faça download deste repositório

2. Abra o projeto no RStudio clicando em `microdatasus.Rproj`

3. O `renv` irá restaurar automaticamente as dependências. Se necessário, execute:

```r
renv::restore()
```

### Execução

Execute o script `extract.R` para baixar e processar os dados:

```r
source("extract.R")
```

## 📊 Funcionalidades

O script `extract.R` realiza as seguintes operações:

1. **Download de Dados**: Baixa microdados do SINAN-DENGUE para o ano de 2025, estado de São Paulo
2. **Processamento**: Processa os dados específicos de dengue com tratamento adequado das variáveis
3. **Filtro**: Filtra os dados para o município de São José do Rio Preto (ID: 354980)
4. **Exportação**: Salva os dados filtrados em arquivo CSV (`dengue_sjrp_2025.csv`)

### Parâmetros Configuráveis

No arquivo `extract.R`, você pode ajustar:

- `year_start` e `year_end`: Período de análise
- `uf`: Unidade Federativa (estado)
- `timeout`: Tempo limite para download (em segundos)
- `ID_MUNICIP`: Código do município para filtro (padrão: 354980 - São José do Rio Preto)
- Nome do arquivo de saída CSV

## 📚 Fontes de Dados

- **DataSUS**: Departamento de Informática do Sistema Único de Saúde
- **SINAN**: Sistema de Informação de Agravos de Notificação
- **Repositório microdatasus**: https://github.com/rfsaldanha/microdatasus

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abrir um Pull Request

## 📝 Licença

Este projeto é de código aberto e está disponível para uso educacional e de pesquisa.

## 👤 Autor

Marco Rodrigues

## 🙏 Agradecimentos

- Equipe do pacote [microdatasus](https://github.com/rfsaldanha/microdatasus)
- DataSUS pela disponibilização dos dados públicos
- Comunidade R Brasil

---

**Nota**: Os dados utilizados são públicos e fornecidos pelo Ministério da Saúde do Brasil através do DataSUS.