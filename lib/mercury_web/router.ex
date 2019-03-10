defmodule MercuryWeb.Router do
  use MercuryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MercuryWeb do
    pipe_through :api
  end
end
