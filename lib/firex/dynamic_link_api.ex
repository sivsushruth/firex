defmodule Firex.DynamicLinkApi do
  use HTTPoison.Base

  @expected_fields ~w(shortLink previewLink error)

  def start_link() do
    __MODULE__.start()
    {:ok, self()}
  end

  def process_request_url(_url) do
    "https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=#{Application.get_env(:firex, :api_key)}"
  end

  def process_response_body(body) do
    data = body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)

    struct(Firex.DynamicLinkResponse, data)
  end
end
