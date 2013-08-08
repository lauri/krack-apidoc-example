module Albums
  class Index < Krack::Endpoint
    def respond
      albums = Album.all
      albums.select! { |album| album[:year] == params["year"].to_i } if params["year"]
      {albums: albums}
    end
  end
end