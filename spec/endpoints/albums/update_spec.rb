require_relative "../../spec_helper"

document Albums::Update do

  meta :group,          "Albums"
  meta :request_method, "PATCH"
  meta :request_path,   "/albums/:id"
  meta :description,    "Updates an album with the given parameters."

  param ":id",    "Id of the album", required: true
  param "name",   "Name of the album"
  param "artist", "Name of the artist"
  param "year",   "Year of release"
  param "rating", "Album rating (1-5)"

  example "Successfully updating an album" do
    patch "/albums/1", rating: "4" do |json|
      json.keys.must_include "album"
      json["album"]["rating"].must_equal 4
    end
  end
end