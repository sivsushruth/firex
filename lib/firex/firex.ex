defmodule Firex do
  def create_dynamic_link(data) do
    {:ok, response} = Firex.DynamicLinkApi.post("/", Poison.encode!(data))
    response.body
  end
end
