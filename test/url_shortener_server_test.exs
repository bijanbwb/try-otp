defmodule ShortenerServerTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = UrlShortener.Server.start_link
    {:ok, pid: pid}
  end

  test "shortening a url", %{pid: pid} do
    :ok = UrlShortener.Server.shorten(pid, "http://apple.com", "apl")
    assert {:ok, "http://apple.com"} == UrlShortener.Server.url(pid, "apl")
  end

  test "finding a url that does not exist", %{pid: pid} do
    assert :error == UrlShortener.Server.url(pid, "aple")
  end

  test "shortening to an existing alias", %{pid: pid} do
    :ok = UrlShortener.Server.shorten(pid, "http://apple.com", "apl")
    assert {:error, :dupalias} == UrlShortener.Server.shorten(pid, "http://google.com", "apl")
  end
end

