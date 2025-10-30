# API de Gestão de Despesas Corporativas

API REST robusta em Elixir/Phoenix para gestão de despesas corporativas.

## Stack Tecnológica

- **Elixir 1.16** - Linguagem funcional com suporte a concorrência
- **Phoenix Framework** - Framework web para APIs
- **PostgreSQL** - Banco de dados relacional (OLTP)
- **DragonFly** - Cache e filas (alternativa ao Redis)
- **ClickHouse** - Banco de dados analítico (OLAP)
- **Docker & Docker Compose** - Containerização

## Arquitetura

O projeto segue os princípios de Domain-Driven Design (DDD) com contextos bem definidos:

```
lib/expense_api/
├── accounts/          # Contexto de usuários e autenticação
├── expenses/          # Contexto de despesas
├── approvals/         # Contexto de aprovações
└── shared/            # Código compartilhado entre contextos
```

## Pré-requisitos

- Docker Desktop instalado
- Docker Compose instalado
- Git configurado

## Comandos Docker

### Subir todos os serviços

```bash
docker-compose up
```

Para rodar em background:

```bash
docker-compose up -d
```

### Ver logs da aplicação

```bash
docker-compose logs -f app
```

### Acessar o console do container

```bash
docker-compose exec app sh
```

### Executar comandos Mix dentro do container

```bash
# Instalar dependências
docker-compose run --rm app mix deps.get

# Criar banco de dados
docker-compose run --rm app mix ecto.create

# Rodar migrações
docker-compose run --rm app mix ecto.migrate

# Executar testes
docker-compose run --rm app mix test

# Console interativo
docker-compose run --rm app iex -S mix
```

### Parar os serviços

```bash
docker-compose down
```

Para remover também os volumes (dados):

```bash
docker-compose down -v
```

## Estrutura de Serviços

### App (Phoenix)
- Porta: 4000
- URL: http://localhost:4000

### PostgreSQL
- Porta: 5432
- Database: expense_api_dev
- User: postgres
- Password: postgres

### DragonFly (Redis)
- Porta: 6379
- URL: redis://localhost:6379

### ClickHouse
- Porta HTTP: 8123
- Porta Native: 9000
- Database: expense_analytics
- User: default
- Password: clickhouse

## Desenvolvimento

### Criar um novo contexto

```bash
docker-compose exec app mix phx.gen.context Expenses Expense expenses \
  description:string amount:decimal category:string user_id:references:users
```

### Criar um novo controller

```bash
docker-compose exec app mix phx.gen.json Expenses Expense expenses \
  description:string amount:decimal category:string user_id:references:users
```

### Reverter última migração

```bash
docker-compose run --rm app mix ecto.rollback
```

## Testes

```bash
# Rodar todos os testes
docker-compose run --rm app mix test

# Rodar com coverage
docker-compose run --rm app mix test --cover

# Rodar testes específicos
docker-compose run --rm app mix test test/expense_api/expenses_test.exs
```

## Boas Práticas

1. **Contextos**: Sempre organize código em contextos bem definidos
2. **Migrations**: Sempre crie migrações reversíveis
3. **Testes**: Mantenha cobertura de testes acima de 80%
4. **Documentation**: Documente funções públicas com `@doc`
5. **Type Specs**: Use `@spec` para definir tipos de funções

## Git Configuration

Este projeto usa:
- **Global**: Configuração da Ezze (trabalho)
- **Local**: Configuração pessoal (fscpinheiro@gmail.com)

Para verificar a configuração local:

```bash
git config --local user.email
git config --local user.name
```

## Troubleshooting

### Porta 4000 já está em uso

```bash
# Parar o serviço que está usando a porta ou mudar no docker-compose.yml
docker-compose down
```

### Problemas com permissões no Windows

Certifique-se de que o Docker Desktop tem acesso à unidade E:\ nas configurações.

### Banco de dados não conecta

```bash
# Verificar se o PostgreSQL está rodando
docker-compose ps

# Recriar o banco
docker-compose run --rm app mix ecto.reset
```
