defmodule ExpenseApiWeb.PlaygroundController do
  use ExpenseApiWeb, :controller

  @doc """
  Rota para testar e aprender conceitos de Elixir
  Acesse: http://localhost:4000/playground
  """
  def index(conn, _params) do
    html(conn, """
    <!DOCTYPE html>
    <html lang="pt-BR">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>🎮 Playground Elixir</title>
      <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: #333;
          padding: 20px;
          min-height: 100vh;
        }
        .container {
          max-width: 1200px;
          margin: 0 auto;
          background: white;
          border-radius: 15px;
          padding: 40px;
          box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }
        h1 {
          color: #667eea;
          font-size: 2.5em;
          margin-bottom: 10px;
          text-align: center;
        }
        .subtitle {
          text-align: center;
          color: #666;
          margin-bottom: 40px;
          font-size: 1.1em;
        }
        .section {
          background: #f8f9fa;
          padding: 25px;
          margin-bottom: 20px;
          border-radius: 10px;
          border-left: 5px solid #667eea;
        }
        .section h2 {
          color: #764ba2;
          margin-bottom: 15px;
          font-size: 1.5em;
        }
        .code {
          background: #2d2d2d;
          color: #f8f8f2;
          padding: 15px;
          border-radius: 8px;
          font-family: 'Courier New', monospace;
          margin: 10px 0;
          overflow-x: auto;
          font-size: 0.9em;
        }
        .result {
          background: #e8f5e9;
          padding: 15px;
          border-radius: 8px;
          margin: 10px 0;
          border-left: 4px solid #4caf50;
        }
        .result strong {
          color: #2e7d32;
        }
        .grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
          gap: 20px;
        }
        .tip {
          background: #fff3cd;
          padding: 15px;
          border-radius: 8px;
          border-left: 4px solid #ffc107;
          margin-top: 20px;
        }
      </style>
    </head>
    <body>
      <div class="container">
        <h1>🎮 Playground Elixir</h1>
        <p class="subtitle">Edite o controller para testar conceitos e ver resultados em tempo real!</p>

        <div class="grid">
          #{render_pattern_matching()}
          #{render_lists()}
          #{render_maps()}
          #{render_pipe()}
          #{render_functions()}
          #{render_atoms()}
          #{render_tuples()}
        </div>

        <div class="tip">
          <strong>💡 Dica:</strong> Edite <code>lib/expense_api_web/controllers/playground_controller.ex</code> e salve.
          A página recarrega automaticamente com as mudanças!
        </div>
      </div>
    </body>
    </html>
    """)
  end

  # Renderização das seções
  defp render_pattern_matching do
    data = test_pattern_matching()
    """
    <div class="section">
      <h2>Pattern Matching</h2>
      <div class="code">{status, message} = {:ok, "Funciona!"}</div>
      <div class="result">
        <strong>Status:</strong> #{inspect(data.status)}<br>
        <strong>Mensagem:</strong> #{data.message}
      </div>
    </div>
    """
  end

  defp render_lists do
    data = test_lists()
    """
    <div class="section">
      <h2>Listas</h2>
      <div class="code">lista = #{inspect(data.original)}</div>
      <div class="result">
        <strong>Dobrado:</strong> #{inspect(data.dobrado)}<br>
        <strong>Filtrado (> 2):</strong> #{inspect(data.filtrado)}<br>
        <strong>Soma:</strong> #{data.somado}<br>
        <strong>Head:</strong> #{data.head} | <strong>Tail:</strong> #{inspect(data.tail)}
      </div>
    </div>
    """
  end

  defp render_maps do
    data = test_maps()
    """
    <div class="section">
      <h2>Maps</h2>
      <div class="code">user = #{inspect(data.original)}</div>
      <div class="result">
        <strong>Acessar:</strong> #{data.acessar_chave}<br>
        <strong>Atualizado:</strong> #{inspect(data.atualizar)}<br>
        <strong>Com novo campo:</strong> #{inspect(data.adicionar)}
      </div>
    </div>
    """
  end

  defp render_pipe do
    data = test_pipe()
    """
    <div class="section">
      <h2>Pipe Operator |></h2>
      <div class="code">#{data.operacoes}</div>
      <div class="result">
        <strong>Resultado:</strong> #{data.resultado}<br>
        <em>#{data.explicacao}</em>
      </div>
    </div>
    """
  end

  defp render_functions do
    data = test_functions()
    """
    <div class="section">
      <h2>Funções & Guards</h2>
      <div class="code">classificar_numero(15) when n > 10</div>
      <div class="result">
        <strong>Com guard:</strong> #{data.funcao_nomeada}<br>
        <strong>Anônima (5²):</strong> #{data.funcao_anonima}<br>
        <strong>Capture:</strong> #{inspect(data.capture)}
      </div>
    </div>
    """
  end

  defp render_atoms do
    data = test_atoms()
    """
    <div class="section">
      <h2>Atoms</h2>
      <div class="code">#{inspect(data.exemplos)}</div>
      <div class="result">
        <strong>Explicação:</strong> #{data.explicacao}<br>
        <strong>Uso comum:</strong> #{data.uso_comum}
      </div>
    </div>
    """
  end

  defp render_tuples do
    data = test_tuples()
    """
    <div class="section">
      <h2>Tuples</h2>
      <div class="code">tuple = {:ok, "Sucesso", 200}</div>
      <div class="result">
        <strong>Como lista:</strong> #{inspect(data.original)}<br>
        <strong>Tamanho:</strong> #{data.tamanho}<br>
        <strong>Elem(1):</strong> #{data.acesso}<br>
        <em>#{data.exemplo}</em>
      </div>
    </div>
    """
  end

  # Pattern Matching
  defp test_pattern_matching do
    {status, message} = {:ok, "Pattern matching funciona!"}

    %{
      resultado: message,
      status: status,
      exemplo: "Use pattern matching para extrair valores"
    }
  end

  # Listas
  defp test_lists do
    lista = [1, 2, 3, 4, 5]

    %{
      original: lista,
      dobrado: Enum.map(lista, fn x -> x * 2 end),
      filtrado: Enum.filter(lista, fn x -> x > 2 end),
      somado: Enum.sum(lista),
      head: hd(lista),
      tail: tl(lista)
    }
  end

  # Maps
  defp test_maps do
    user = %{name: "Francisco", role: "Developer", level: 9000}

    %{
      original: user,
      acessar_chave: user.name,
      atualizar: %{user | level: 9001},
      adicionar: Map.put(user, :city, "Brasil")
    }
  end

  # Pipe Operator |>
  defp test_pipe do
    resultado =
      [1, 2, 3, 4, 5]
      |> Enum.map(&(&1 * 2))
      |> Enum.filter(&(&1 > 5))
      |> Enum.sum()

    %{
      explicacao: "O pipe passa o resultado de uma função para a próxima",
      operacoes: "lista |> dobrar |> filtrar |> somar",
      resultado: resultado
    }
  end

  # Funções e Guards
  defp test_functions do
    %{
      funcao_nomeada: classificar_numero(15),
      funcao_anonima: (fn x -> x * x end).(5),
      capture: Enum.map([1, 2, 3], &(&1 * 2))
    }
  end

  defp classificar_numero(n) when n > 10, do: "maior que 10"
  defp classificar_numero(n) when n < 10, do: "menor que 10"
  defp classificar_numero(_n), do: "igual a 10"

  # Atoms
  defp test_atoms do
    %{
      explicacao: "Atoms são constantes onde o nome é o valor",
      exemplos: [:ok, :error, :success, :pending],
      uso_comum: "Muito usado em tuples para indicar status: {:ok, result}"
    }
  end

  # Tuples
  defp test_tuples do
    tuple = {:ok, "Sucesso", 200}

    %{
      original: Tuple.to_list(tuple),
      tamanho: tuple_size(tuple),
      acesso: elem(tuple, 1),
      uso: "Retorno de funções com status",
      exemplo: "Para JSON, converta com Tuple.to_list/1"
    }
  end
end
