module Albums
  class Create < Krack::Endpoint
    def respond
      if %w[name artist year].any? { |p| params[p].nil? }
        throw :halt, 400
      end

      {
        album: {
          id:     Album::DB.size.next,
          name:   params["name"],
          artist: params["artist"],
          year:   params["year"].to_i
        }
      }
    end
  end
end