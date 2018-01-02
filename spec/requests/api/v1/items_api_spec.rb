require "rails_helper"

describe "Items API" do

  before(:all) do
    DatabaseCleaner.clean
    create_list(:item, 3)
  end

  it "can return all items" do
    get '/api/v1/items'

    expect(response.code).to eq("200")

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
    items.each do |item|
      expect(item).to have_key("id")
      expect(item).to have_key("name")
      expect(item).to have_key("description")
      expect(item).to have_key("image_url")
      expect(item).not_to have_key("created_at")
      expect(item).not_to have_key("updated_at")
    end
  end

  it "can return a single item" do
    get "/api/v1/items/#{Item.first.id}"

    expect(response.code).to eq("200")

    item = JSON.parse(response.body)

    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
    expect(item).not_to have_key("created_at")
    expect(item).not_to have_key("updated_at")
  end

  it "can delete a single item" do
    delete "/api/v1/items/#{Item.first.id}"

    expect(response.code).to eq("204")

    expect(Item.count).to eq(2)
  end
end

# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
