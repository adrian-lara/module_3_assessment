require 'rails_helper'

describe "As a user, when I visit '/', fill the search bar with '80202', and click 'search'" do
  it "then my current path should be '/search', and I should see 10 stores (with their long name, city, distance, phone number, and store type) as well as a message that says '17 Total Stores'" do
    VCR.use_cassette("stores_search_80202") do
      visit '/'

      fill_in "q", with: "80202"
      click_on "search"

      expect(current_path).to eq("/search")

      expect(page).to have_content("17 Total Stores")

      expect(page).to have_css(".store_info", count: 10)
      expect(page).to have_css(".long_name", count: 10)
      expect(page).to have_css(".city", count: 10)
      expect(page).to have_css(".distance", count: 10)
      expect(page).to have_css(".phone", count: 10)
      expect(page).to have_css(".store_type", count: 10)
    end
  end
end
