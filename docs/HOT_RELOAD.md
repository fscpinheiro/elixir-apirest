# Hot Reload no Docker

O hot reload está configurado e funcionando! Aqui está como usar:

## Como funciona

O Phoenix detecta automaticamente mudanças nos arquivos `.ex` e recompila apenas o necessário.

## Testando o Hot Reload

1. **Certifique-se que o container está rodando**:
```bash
docker-compose up
```

2. **Edite qualquer arquivo** (exemplo: `lib/expense_api_web/controllers/health_controller.ex`)

3. **Salve o arquivo** e veja os logs do Docker:
```
[info] Compiling 1 file (.ex)
```

4. **Atualize o navegador** - as mudanças já estarão aplicadas!

## Exemplo de teste rápido

Edite `lib/expense_api_web/controllers/health_controller.ex`:

```elixir
def index(conn, _params) do
  json(conn, %{
    status: "ok",
    message: "Hot Reload Funcionando! 🔥", # Mude esta linha
    timestamp: DateTime.utc_now(),
    version: "1.0.0"
  })
end
```

Salve e acesse http://localhost:4000 - a mudança aparecerá automaticamente!

## Troubleshooting

### Hot reload não está funcionando?

**Opção 1**: Reinicie apenas o container da app:
```bash
docker-compose restart app
```

**Opção 2**: Ver logs para detectar erros:
```bash
docker-compose logs -f app
```

**Opção 3**: Se persistir, rebuild completo:
```bash
docker-compose down
docker-compose up --build
```

## O que NÃO recarrega automaticamente

- Mudanças em `mix.exs` (dependências) - precisa `docker-compose restart app`
- Mudanças em `config/*.exs` - precisa reiniciar
- Mudanças no `Dockerfile` - precisa rebuild

## Dica Pro

Mantenha os logs do Docker abertos em um terminal separado:
```bash
docker-compose logs -f app
```

Assim você vê em tempo real quando o código recompila!
