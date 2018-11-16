defmodule Firex.DynamicLink do
  @endpoint "https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=#{Application.get_env(:firex, :api_key)}"
  def create_dynamic_link(data) do
    case Firex.DynamicLinkApi.post(@endpoint, Poison.encode!(data)) do
      {:ok, r} -> r.body
      e -> e
    end
  end
end
