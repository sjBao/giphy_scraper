# GiphyScraper


Running locally example:
```shell
iex -S mix
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
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/giphy_scraper>.

