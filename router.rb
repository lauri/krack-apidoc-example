Dir["#{__dir__}/endpoints/**/*.rb"].each { |file| require file }

App = Krack::Router.new {
  get "/albums",        Albums::Index
  get "/albums/:id",    Albums::Show
  post "/albums",       Albums::Create
  patch "/albums/:id",  Albums::Update
  delete "/albums/:id", Albums::Destroy
  get "/artists/list",  Artists::List
}

class Album
  DB = [
    {id: 1, name: "In a Silent Way", artist: "Miles Davis", year: 1969, rating: 3},
    {id: 2, name: "Transformer", artist: "Lou Reed", year: 1972, rating: 4},
    {id: 3, name: "Harvest", artist: "Neil Young", year: 1972, rating: 4},
    {id: 4, name: "Off the Wall", artist: "Michael Jackson", year: 1979, rating: 4},
    {id: 5, name: "Unknown Pleasures", artist: "Joy Division", year: 1979, rating: 3},
    {id: 6, name: "Loveless", artist: "My Bloody Valentine", year: 1991, rating: 5}
  ]
  def self.all; DB.clone end
  def self.find(id); all.find { |row| row[:id] == id.to_i } end
end
