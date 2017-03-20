module Albums
  class Index < Krack::Endpoint
    def respond
      sort = params["sort"] || :year
      year = params["year"]

      albums = Album.all.sort_by { |album| album[sort.to_sym] }
      albums.select! { |album| album[:year] == year.to_i } if year

      {albums: albums}
    end
  end
end