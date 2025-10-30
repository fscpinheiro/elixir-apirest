# Dockerfile para desenvolvimento
FROM elixir:1.16-alpine

# Instalar dependências do sistema
RUN apk add --no-cache \
    build-base \
    git \
    postgresql-client \
    inotify-tools \
    nodejs \
    npm

# Instalar Hex e Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Instalar Phoenix
RUN mix archive.install hex phx_new --force

# Criar diretório de trabalho
WORKDIR /app

# Expor porta padrão do Phoenix
EXPOSE 4000

# Comando padrão
CMD ["mix", "phx.server"]
