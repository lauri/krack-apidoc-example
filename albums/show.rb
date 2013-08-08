module Albums
  class Show < Krack::Endpoint
    def respond
      album = Album.find(params["id"]) or throw :halt, 404
      {album: album}
    end
  end
end