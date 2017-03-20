module Artists
  class List < Krack::Endpoint
    def respond
      artists = Album.all.map { |album| album[:artist] }

      {artists: artists}
    end
  end
end