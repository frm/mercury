defmodule Mercury.DataStorage.Errors.NotFound do
  defexception message: "Could not find record"

  @type t :: %__MODULE__{message: String.t()}
end
