require_relative "../../spec_helper"

document Albums::Show do

  meta :group,          "Albums"
  meta :request_method, "GET"
  meta :request_path,   "/albums/:id"
  meta :description,    "Returns a single album with the id given in the URL."

  param ":id", "Id of the album", required: true

  example "Successfully requesting an album" do
    get "/albums/1" do |json|
      json.keys.must_include "album"
      json["album"]["id"].must_equal 1
    end
  end

  example "Failure when album is not found" do
    get "/albums/42" do |json|
      json.keys.must_include "error"
      last_response.status.must_equal 404
    end
  end
end