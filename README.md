# UrlShortener

Basic Implementation:

- [Tests](https://github.com/bijanbwb/try-otp/blob/master/test/url_shortener_test.exs)
- [Implementation](https://github.com/bijanbwb/try-otp/blob/master/lib/url_shortener.ex#L1)


GenServer Implementation:

- [Tests](https://github.com/bijanbwb/try-otp/blob/master/test/url_shortener_server_test.exs)
- [Implementation](https://github.com/bijanbwb/try-otp/blob/master/lib/url_shortener.ex#L18)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `url_shortener` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:url_shortener, "~> 0.1.0"}]
    end
    ```

  2. Ensure `url_shortener` is started before your application:

    ```elixir
    def application do
      [applications: [:url_shortener]]
    end
    ```

