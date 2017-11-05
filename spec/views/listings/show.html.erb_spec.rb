require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :store => nil,
      :title => "Title",
      :variety => "Variety",
      :countryregion => "Countryregion",
      :producer => "Producer",
      :notes => "Notes",
      :roast => "Roast",
      :grind => false,
      :weight => 2,
      :about => "MyText",
      :price => 3,
      :shipping => 4,
      :product_image_data => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Variety/)
    expect(rendered).to match(/Countryregion/)
    expect(rendered).to match(/Producer/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/Roast/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
  end
end
