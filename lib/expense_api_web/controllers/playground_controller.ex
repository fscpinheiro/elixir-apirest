defmodule ExpenseApiWeb.PlaygroundController do
  use ExpenseApiWeb, :controller

  @doc """
  Rota para testar e aprender conceitos de Elixir
  Acesse: http://localhost:4000/playground
  """
  def index(conn, _params) do
    json(conn, %{
      message: "🎮 Playground Elixir - Edite este controller para testar conceitos!",
      examples: %{
        pattern_matching: test_pattern_matching(),
        lists: test_lists(),
        maps: test_maps(),
        pipe_operator: test_pipe(),
        functions: test_functions(),
        atoms: test_atoms(),
        tuples: test_tuples()
      }
    })
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
