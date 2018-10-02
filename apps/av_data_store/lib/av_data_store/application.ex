defmodule AVDataStore.Application do
  @moduledoc """
  The AVDataStore Application Service.

  The AV DataStore system business domain lives in this application.

  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(AVDataStore.Repo, []),
    ], strategy: :one_for_one, name: AVDataStore.Supervisor)
  end
end
