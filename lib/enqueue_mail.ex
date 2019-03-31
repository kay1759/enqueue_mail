defmodule EnqueueMail do
  @moduledoc """
  Documentation for EnqueuMail
  Run as a worker for Supervisor
  """
  use GenServer
  use AMQP

  @config Application.get_env(:enqueue_mail, __MODULE__, [])

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: EnqueuMailServer)
  end

  def send_mail(payload) do
    GenServer.cast(EnqueuMailServer, payload)
  end
    
  @impl true
  def init(_opts) do
    {:ok, conn} = Connection.open(@config[:amqp_server])
    {:ok, chan} = Channel.open(conn)

    {:ok, {conn, chan}}
  end
 
  @impl true
  def handle_cast(payload, {conn, chan}) do
    publish(chan, @config[:exchange], @config[:queue], payload)
    {:noreply, {conn, chan}}
  end

  @impl true
  def terminate(_payload, {_conn, _chan}) do
    # Connection.close(conn)
  end

  defp publish(chan, exchange, queue, payload) do
    Basic.publish(chan, exchange, queue, payload)
  rescue
    err ->
      {:error, err}
  end
end
