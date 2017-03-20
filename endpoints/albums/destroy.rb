module Albums
  class Destroy < Krack::Endpoint
    def respond
      Show.new(env).respond
    end
  end
end