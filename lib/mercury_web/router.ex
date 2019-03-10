defmodule MercuryWeb.Router do
  use MercuryWeb, :router

  @env Mix.env()

  pipeline :api do
    plug :accepts, ["json"]
  end

  if @env == :dev do
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MercuryWeb.Schema
  end

  scope "/api", MercuryWeb do
    pipe_through :api

    forward "/", Absinthe.Plug, schema: GraphqlWeb.Schema
  end
end
