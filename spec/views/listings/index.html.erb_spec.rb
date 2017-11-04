require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
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
      ),
      Listing.create!(
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
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Variety".to_s, :count => 2
    assert_select "tr>td", :text => "Countryregion".to_s, :count => 2
    assert_select "tr>td", :text => "Producer".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => "Roast".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
