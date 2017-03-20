module Albums
  class Create < Krack::Endpoint
    def respond
      if %w[name artist year rating].any? { |p| params[p].nil? }
        throw :halt, 400
      end

      {
        album: {
          id:     Album::DB.size.next,
          name:   params["name"],
          artist: params["artist"],
          year:   params["year"].to_i,
          rating: params["rating"].to_i
        }
      }
    end
  end
end