require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :store => nil,
      :title => "MyString",
      :variety => "MyString",
      :countryregion => "MyString",
      :producer => "MyString",
      :notes => "MyString",
      :roast => "MyString",
      :grind => false,
      :weight => 1,
      :about => "MyText",
      :price => 1,
      :shipping => 1,
      :product_image_data => "MyText"
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[store_id]"

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[variety]"

      assert_select "input[name=?]", "listing[countryregion]"

      assert_select "input[name=?]", "listing[producer]"

      assert_select "input[name=?]", "listing[notes]"

      assert_select "input[name=?]", "listing[roast]"

      assert_select "input[name=?]", "listing[grind]"

      assert_select "input[name=?]", "listing[weight]"

      assert_select "textarea[name=?]", "listing[about]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[shipping]"

      assert_select "textarea[name=?]", "listing[product_image_data]"
    end
  end
end
