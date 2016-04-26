require 'rails_helper'

RSpec.describe "Items api" do
  it "returns all items" do
    item1 = Item.create(
      name: "Cat",
      description: "furry",
      image_url: "http://robohash.org/.png?set=set2&bgset=bg1&size=200x200"
      )
    item2 = Item.create(
      name: "dog",
      description: "silly",
      image_url: "http://robohash.org/"
      )

    get "/api/v1/items.json"

    items = JSON.parse(response.body)

    expect(status).to eq(200)
    expect(items.count).to eq(2)
    expect(items.first).to have_key "name"
    expect(items.first).to have_key "description"
    expect(items.first).to have_key "image_url"
    expect(items.first).to_not have_key :created_at
    expect(items.first).to_not have_key :updates_at
  end

  it "returns single item" do
    item1 = Item.create(
      name: "Cat",
      description: "furry",
      image_url: "http://robohash.org/.png?set=set2&bgset=bg1&size=200x200"
      )
    item2 = Item.create(
      name: "dog",
      description: "silly",
      image_url: "http://robohash.org/"
      )

    get "/api/v1/items/#{item1.id}.json"

    item = JSON.parse(response.body)

    expect(status).to eq(200)

    expect(item["name"]).to eq("Cat")
    expect(item["name"]).to_not eq("Dog")
  end

  it "deletes an item" do
    item1 = Item.create(
      name: "Cat",
      description: "furry",
      image_url: "http://robohash.org/.png?set=set2&bgset=bg1&size=200x200"
      )
    item2 = Item.create(
      name: "dog",
      description: "silly",
      image_url: "http://robohash.org/"
      )

    get "/api/v1/items.json"
    items = JSON.parse(response.body)
    expect(status).to eq(200)
    expect(items.count).to eq(2)

    delete "/api/v1/items/#{item1.id}.json"
    expect(status).to eq(204)

    get "/api/v1/items.json"
    items = JSON.parse(response.body)
    expect(status).to eq(200)
    expect(items.count).to eq(1)
  end

  it "creates an item" do
    item1 = Item.create(
      name: "Cat",
      description: "furry",
      image_url: "http://robohash.org/.png?set=set2&bgset=bg1&size=200x200"
      )
    get "/api/v1/items.json"
    items = JSON.parse(response.body)
    expect(status).to eq(200)
    expect(items.count).to eq(1)

    post "/api/v1/items.json", {name: "Goat", description: "annoying", image_url: "http://robohash.org/"}
    expect(status).to eq(201)

    get "/api/v1/items.json"
    items = JSON.parse(response.body)
    expect(status).to eq(200)
    expect(items.count).to eq(2)
  end
end
