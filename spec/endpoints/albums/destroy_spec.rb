require_relative "../../spec_helper"

document Albums::Destroy do

  meta :group,          "Albums"
  meta :request_method, "DELETE"
  meta :request_path,   "/albums/:id"
  meta :description,    "Deletes the album identified by the id given in the URL."

  param ":id", "Id of the album", required: true

  example "Successfully deleting an album" do
    delete "/albums/1" do |json|
      json.keys.must_include "album"
    end
  end
end