defmodule Firex.DynamicLink do
  def create_dynamic_link(data) do
    case Firex.DynamicLinkApi.post("/", Poison.encode!(data)) do
      {:ok, r} -> r.body
      e -> e
    end
  end
end
