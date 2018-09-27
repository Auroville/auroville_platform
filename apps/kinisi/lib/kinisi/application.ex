defmodule Kinisi.Application do
  @moduledoc """
  The Kinisi Application Service.

  The kinisi system business domain lives in this application.

  Exposes API to clients such as the `KinisiWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Kinisi.Repo, []),
    ], strategy: :one_for_one, name: Kinisi.Supervisor)
  end
end
