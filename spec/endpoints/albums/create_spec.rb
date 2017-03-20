require_relative "../../spec_helper"

document Albums::Create do

  meta :group,          "Albums"
  meta :request_method, "POST"
  meta :request_path,   "/albums"
  meta :description,    "Creates a new album with the given parameters."

  param "name",   "Name of the album", required: true
  param "artist", "Name of the artist", required: true
  param "year",   "Year of release", required: true
  param "rating", "Album rating (1-5)", required: true

  example "Successfully creating an album" do
    post "/albums", name: "The Meters", artist: "The Meters", year: "1969", rating: "4" do |json|
      json.keys.must_include "album"
      json["album"]["name"].must_equal "The Meters"
      json["album"]["year"].must_be_kind_of Integer
    end
  end

  example "Failure when some parameters are missing" do
    post "/albums", name: "The Meters", year: "1969" do |json|
      json.keys.must_include "error"
      last_response.status.must_equal 400
    end
  end
end