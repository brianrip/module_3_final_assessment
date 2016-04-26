require 'rails_helper'

RSpec.describe "items request" do
  it "returns all items" do

    get "/api/v1/items.json"

    expect(status).to eq(200)
    expect(response.body).to eq(Item.all.to_json)
  end
end
  # We need an API for the application that can both read and write data. Start by focusing on functionality for items. All of this should happen in a dedicated, versioned controller.
  # ​
  # When I send a GET request to `/api/v1/items`
  # I receive a 200 JSON response containing all items
  # And each item has a name, description, and image_url but not the created_at or updated_at
  # ​
  # When I send a GET request to `/api/v1/items/1`
  # I receive a 200 JSON response containing the name, description, and image_url but not the created_at or updated_at
  # ​
  # When I send a DELETE request to `/api/v1/items/1`
  # I receive a 204 JSON response if the record is successfully deleted
  # ​
  # When I send a POST request to `/api/v1/items` with a name, description, and image_url
  # I receive a 201 JSON  response if the record is successfully created
  # And I receive a JSON response containing the name, description, and image_url but not the created_at or updated_at
