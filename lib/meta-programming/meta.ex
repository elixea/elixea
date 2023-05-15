defmodule MathLogger do
  @doc """
  Operation: {:add, [2, 3]} = 5
  """
  defmacro log(args, do: block) do
    quote do
      result = unquote(block)
      IO.puts("Operation: #{inspect(unquote(args))} = #{inspect(result)}")
      result
    end
  end
end

defmodule Math do
  import MathLogger

  def add(a, b) do
    # using the "log" macro with the *add* args and the two variables
    log({:add, [a, b]}, do: a + b)
  end
end

Math.add(2, 3)
