defmodule Actor do
  @doc """
  Example output:

  Received message: "Hello from #PID<0.103.0>"
  Received reply: "Processed message"
  Received message: "Hello from #PID<0.104.0>"
  Received reply: "Processed message"
  """
  def start_link do
    {:ok, pid} = Task.start_link(fn -> loop() end)
    pid
  end

  defp loop do
    receive do
      {sender, message} ->
        IO.puts("Received message: #{inspect(message)}")
        send(sender, "Processed message")
        loop()
    end
  end
end

# Start two actors
actor1 = Actor.start_link()
actor2 = Actor.start_link()

# Send messages to both actors and receive replies
for actor <- [actor1, actor2] do
  send(actor, {self(), "Hello from #{inspect(actor)}"})

  receive do
    message -> IO.puts("Received reply: #{inspect(message)}")
  end
end
