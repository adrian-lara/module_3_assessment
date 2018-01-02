require "rails_helper"

describe "Items API" do

  before(:all) do
    DatabaseCleaner.clean
    create_list(:item, 3)
  end

  it "can return all items" do
    get '/api/v1/items'

    expect(response).to be_success

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

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
    expect(item).not_to have_key("created_at")
    expect(item).not_to have_key("updated_at")
  end
end

# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
