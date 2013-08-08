require_relative '../spec_helper'

document Albums::Index do

  meta :group,          "Albums"
  meta :request_method, "GET"
  meta :request_path,   "/albums"
  meta :description,    "Returns all albums. You can optionally filter by year by supplying the year parameter."

  param "year", "If given, only albums from this year will be returned"

  example "Requesting all albums" do
    get "/albums" do |json|
      json.keys.must_include "albums"
      json["albums"].size.must_be :>, 0
    end
  end

  example "Requesting all albums from 1979" do
    get "/albums", :year => "1979" do |json|
      json.keys.must_include "albums"
      json["albums"].size.must_be :>, 0
    end
  end
end