require_relative "../../spec_helper"

document Albums::Index do

  meta :group,          "Albums"
  meta :request_method, "GET"
  meta :request_path,   "/albums"
  meta :description,    "Returns all albums. You can optionally filter or sort the results by passing extra parameters."

  param "year", "If given, only albums from this year will be returned"
  param "sort", "Sorts the results by the given attribute.", default: "year"

  example "Requesting all albums" do
    get "/albums" do |json|
      json.keys.must_include "albums"
      json["albums"].size.must_equal 6
    end
  end

  example "Requesting all albums from 1979, sorted by rating" do
    get "/albums", year: "1979", sort: "rating" do |json|
      json.keys.must_include "albums"
      json["albums"].size.must_equal 2
      json["albums"].first["rating"].must_be :<, json["albums"].last["rating"]
    end
  end
end