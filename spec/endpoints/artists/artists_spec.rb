require_relative "../../spec_helper"

document Artists::List do

  meta :group,        "Artists"
  meta :description,  "Returns a list of all artists."

  example do
    get "/artists/list" do |json|
      json.keys.must_include "artists"
      json["artists"].size.must_equal 6
    end
  end
end