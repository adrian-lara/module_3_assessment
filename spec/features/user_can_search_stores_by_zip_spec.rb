require 'rails_helper'

describe "As a user, when I visit '/', fill the search bar with '80202', and click 'search'" do
  it "then my current path should be '/search', and I should see 10 stores (with their long name, city, distance, phone number, and store type) as well as a message that says '17 Total Stores'" do
    # When I visit "/"
    visit '/'

    # And I fill in a search box with "80202" and click "search"
    fill_in "q", with: "80202"
    click_on "search"

    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq("/search")

    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content("17 Total Stores")

    # And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
    expect(page).to have_css("store_info", count: 10)
    # And I should see the long name, city, distance, phone number and store type for each of the 10 results
    expect(page).to have_css("long_name", count: 10)
    expect(page).to have_css("city", count: 10)
    expect(page).to have_css("distance", count: 10)
    expect(page).to have_css("phone", count: 10)
    expect(page).to have_css("store_type", count: 10)
  end
end

# As a user
# And I should see stores within 25 miles of 80202
