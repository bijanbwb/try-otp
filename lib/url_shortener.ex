defmodule UrlShortener.Basic do
  def start_link do
    spawn_link(__MODULE__, :loop, [%{}])
  end

  def loop(state) do
    receive do
      {:shorten, pid, short, url} ->
        send(pid, :ok)
        loop(Map.put(state, short, url))
      {:url, pid, short} ->
        send(pid, Map.fetch(state, short))
        loop(state)
    end
  end
end

defmodule UrlShortener.Server do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, %{}, opts)
  end

  def init(state) do
    {:ok, state}
  end

  def shorten(pid, url, short) do
    GenServer.call(pid, {:shorten, short, url})
  end

  def url(pid, short) do
    GenServer.call(pid, {:url, short})
  end

  # Callbacks

  def handle_call({:shorten, short, url}, _from, state) do
    case Map.fetch(state, short) do
      :error ->
        {:reply, :ok, Map.put(state, short, url)}
      _ ->
        {:reply, {:error, :dupalias}, state} 
    end
  end

  def handle_call({:url, short}, _from, state) do
    {:reply, Map.fetch(state, short), state}
  end
end
