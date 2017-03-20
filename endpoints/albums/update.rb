module Albums
  class Update < Krack::Endpoint
    def respond
      album = Album.find(params["id"]) or throw :halt, 404
      {album: album.merge(rating: params["rating"].to_i)}
    end
  end
end