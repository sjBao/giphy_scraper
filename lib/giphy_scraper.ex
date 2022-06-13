defmodule GiphyScraper do
  @moduledoc """
  Documentation for `GiphyScraper`.
  """
  @giphy_url "api.giphy.com/v1/gifs/search"
  @api_key IO.gets("Please input Giphy API: ") |> String.trim()

  @doc """
  Giphy Scraper

  ## Examples

      iex> GiphyScraper.search("lebron")
      [
        %GiphyImage{
          id: "3o7aTnQqygA3TcukFi",
          title: "Lebron James Basketball GIF by NBA",
          url: "https://giphy.com/gifs/nba-basketball-3o7aTnQqygA3TcukFi",
          username: "nba"
        },
        %GiphyImage{
          id: "mpB75VlHUWWmIX3WbN",
          title: "Celebrate Lebron James GIF by ESPN",
          url: "https://giphy.com/gifs/espn-lebron-james-cigar-mpB75VlHUWWmIX3WbN",
          username: "espn"
        },
        ...
      ]
  """
  @spec search(query :: String.t()) :: list(GiphyImage.t())
  def search(query) do
    with {:ok, %{status_code: 200, body: body}} <-
           query_giphy_api(String.replace(query, ~r/[[:space:]]+/, "-")) do
      parse_giphy_api_success_response_body(body)
    else
      {:error, error_response} -> handle_giphy_api_response_error(error_response)
      {:ok, %{status_code: 400}} -> {:error, "No image found for query: '#{query}'"}
    end
  end

  def query_giphy_api(query) do
    HTTPoison.get("#{@giphy_url}?q=#{query}&api_key=#{@api_key}")
  end

  defp handle_giphy_api_response_error(error) do
    IO.inspect(error)
  end

  defp parse_giphy_api_success_response_body(body) do
    body
    |> Jason.decode()
    |> elem(1)
    |> Map.get("data")
    |> Enum.map(fn %{"id" => id, "title" => title, "url" => url, "username" => username} ->
      %GiphyImage{id: id, title: title, url: url, username: username}
    end)
  end
end
