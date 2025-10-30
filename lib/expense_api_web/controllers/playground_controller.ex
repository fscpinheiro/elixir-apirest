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
          font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
          background: #ffffff;
          color: #24292f;
          padding: 40px 20px;
          line-height: 1.6;
        }
        .container {
          max-width: 980px;
          margin: 0 auto;
        }
        h1 {
          color: #24292f;
          font-size: 2em;
          font-weight: 600;
          margin-bottom: 8px;
          padding-bottom: 8px;
          border-bottom: 1px solid #d0d7de;
        }
        .subtitle {
          color: #57606a;
          margin-bottom: 30px;
          font-size: 1em;
        }
        .section {
          margin-bottom: 32px;
        }
        .section h2 {
          color: #24292f;
          font-size: 1.5em;
          font-weight: 600;
          margin-bottom: 16px;
          padding-bottom: 8px;
          border-bottom: 1px solid #d0d7de;
        }
        .code {
          background: #f6f8fa;
          color: #24292f;
          padding: 16px;
          border-radius: 6px;
          border: 1px solid #d0d7de;
          font-family: ui-monospace, SFMono-Regular, 'SF Mono', Menlo, Consolas, 'Liberation Mono', monospace;
          margin: 12px 0;
          overflow-x: auto;
          font-size: 0.85em;
        }
        .result {
          background: #ffffff;
          padding: 16px;
          border-radius: 6px;
          border: 1px solid #d0d7de;
          margin: 12px 0;
        }
        .result strong {
          color: #0969da;
          font-weight: 600;
        }
        .result em {
          color: #57606a;
          font-style: italic;
          display: block;
          margin-top: 8px;
        }
        .grid {
          display: flex;
          flex-direction: column;
          gap: 0;
        }
        .tip {
          background: #fff8c5;
          padding: 16px;
          border-radius: 6px;
          border: 1px solid #d4c894;
          margin-top: 32px;
          font-size: 0.9em;
        }
        .tip strong {
          color: #7d4e00;
        }
        code {
          background: #f6f8fa;
          padding: 2px 6px;
          border-radius: 3px;
          font-family: ui-monospace, SFMono-Regular, monospace;
          font-size: 0.9em;
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
          #{render_recursao()}
          #{render_comprehensions()}
          #{render_structs()}
          #{render_with()}
          #{render_strings()}
          #{render_processos()}
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
        <strong>Resultado:</strong> #{data.resultado}<br>
        <em>#{data.exemplo}</em>
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

  # Recursão
  defp render_recursao do
    data = test_recursao()
    """
    <div class="section">
      <h2>Recursão</h2>
      <div class="code">fatorial(5) = 5 * 4 * 3 * 2 * 1</div>
      <div class="result">
        <strong>Fatorial de 5:</strong> #{data.fatorial}<br>
        <strong>Fibonacci(10):</strong> #{data.fibonacci}<br>
        <strong>Soma [1..100]:</strong> #{data.soma_recursiva}<br>
        <em>Recursão é fundamental em programação funcional!</em>
      </div>
    </div>
    """
  end

  defp test_recursao do
    %{
      fatorial: fatorial(5),
      fibonacci: fibonacci(10),
      soma_recursiva: soma_lista([1, 2, 3, 4, 5])
    }
  end

  defp fatorial(0), do: 1
  defp fatorial(n), do: n * fatorial(n - 1)

  defp fibonacci(0), do: 0
  defp fibonacci(1), do: 1
  defp fibonacci(n), do: fibonacci(n - 1) + fibonacci(n - 2)

  defp soma_lista([]), do: 0
  defp soma_lista([head | tail]), do: head + soma_lista(tail)

  # Comprehensions
  defp render_comprehensions do
    data = test_comprehensions()
    """
    <div class="section">
      <h2>Comprehensions</h2>
      <div class="code">for n <- 1..5, do: n * n</div>
      <div class="result">
        <strong>Quadrados:</strong> #{inspect(data.quadrados)}<br>
        <strong>Pares até 10:</strong> #{inspect(data.pares)}<br>
        <strong>Produto cartesiano:</strong> #{inspect(data.cartesiano)}<br>
        <strong>Map de lista:</strong> #{inspect(data.into_map)}<br>
        <em>Comprehensions são loops funcionais!</em>
      </div>
    </div>
    """
  end

  defp test_comprehensions do
    %{
      quadrados: for(n <- 1..5, do: n * n),
      pares: for(n <- 1..10, rem(n, 2) == 0, do: n),
      cartesiano: for(x <- [1, 2], y <- [:a, :b], do: {x, y}) |> Enum.map(&Tuple.to_list/1),
      into_map: for({k, v} <- [a: 1, b: 2], into: %{}, do: {k, v * 10})
    }
  end

  # Structs
  defp render_structs do
    data = test_structs()
    """
    <div class="section">
      <h2>Structs</h2>
      <div class="code">defmodule User do<br>&nbsp;&nbsp;defstruct [:name, :age, role: "user"]<br>end</div>
      <div class="result">
        <strong>User criado:</strong> #{inspect(data.user)}<br>
        <strong>Acessar campo:</strong> #{data.name}<br>
        <strong>Atualizado:</strong> #{inspect(data.updated)}<br>
        <em>Structs são maps tipados com valores padrão</em>
      </div>
    </div>
    """
  end

  defp test_structs do
    # Simula um struct com map (struct real precisa ser definido no topo do módulo)
    user = %{__struct__: User, name: "Francisco", age: 30, role: "Developer"}

    %{
      user: user,
      name: user.name,
      updated: %{user | age: 31}
    }
  end

  # With (Error Handling)
  defp render_with do
    data = test_with()
    """
    <div class="section">
      <h2>With (Error Handling)</h2>
      <div class="code">with {:ok, value} <- funcao1(),<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{:ok, result} <- funcao2(value) do<br>&nbsp;&nbsp;result<br>end</div>
      <div class="result">
        <strong>Caso sucesso:</strong> #{inspect(data.sucesso)}<br>
        <strong>Caso erro:</strong> #{inspect(data.erro)}<br>
        <em>With encadeia operações que podem falhar</em>
      </div>
    </div>
    """
  end

  defp test_with do
    %{
      sucesso: processar_usuario(%{nome: "Francisco", idade: 30}),
      erro: processar_usuario(%{nome: "", idade: 15})
    }
  end

  defp processar_usuario(dados) do
    with {:ok, nome} <- validar_nome(dados.nome),
         {:ok, idade} <- validar_idade(dados.idade) do
      {:ok, "Usuário #{nome} (#{idade} anos) validado!"}
    else
      {:error, reason} -> {:error, reason}
    end
  end

  defp validar_nome(""), do: {:error, "Nome vazio"}
  defp validar_nome(nome), do: {:ok, nome}

  defp validar_idade(idade) when idade < 18, do: {:error, "Menor de idade"}
  defp validar_idade(idade), do: {:ok, idade}

  # Strings
  defp render_strings do
    data = test_strings()
    """
    <div class="section">
      <h2>String Manipulation</h2>
      <div class="code">String.upcase("elixir")</div>
      <div class="result">
        <strong>Uppercase:</strong> #{data.uppercase}<br>
        <strong>Split:</strong> #{inspect(data.split)}<br>
        <strong>Interpolação:</strong> #{data.interpolacao}<br>
        <strong>Pattern match:</strong> #{data.pattern}<br>
        <strong>Trim:</strong> "#{data.trim}"<br>
        <em>Strings em Elixir são UTF-8 binaries</em>
      </div>
    </div>
    """
  end

  defp test_strings do
    "Olá " <> nome = "Olá Francisco"

    %{
      uppercase: String.upcase("elixir"),
      split: String.split("um,dois,tres", ","),
      interpolacao: "Resultado: #{2 + 2}",
      pattern: nome,
      trim: String.trim("  espaços  ")
    }
  end

  # Processos
  defp render_processos do
    data = test_processos()
    """
    <div class="section">
      <h2>Processos (Concurrency)</h2>
      <div class="code">spawn(fn -> IO.puts("Hello") end)</div>
      <div class="result">
        <strong>PID atual:</strong> #{inspect(data.current_pid)}<br>
        <strong>Mensagem enviada:</strong> #{inspect(data.mensagem)}<br>
        <strong>Task executada:</strong> #{data.task_result}<br>
        <em>Processos são leves e isolados em Elixir!</em>
      </div>
    </div>
    """
  end

  defp test_processos do
    # Task simples
    task = Task.async(fn ->
      Process.sleep(10)
      "Tarefa concluída!"
    end)

    %{
      current_pid: self(),
      mensagem: "Processos se comunicam via mensagens",
      task_result: Task.await(task)
    }
  end
end
