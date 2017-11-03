require 'rails_helper'

RSpec.describe "stores/new", type: :view do
  before(:each) do
    assign(:store, Store.new(
      :user => nil,
      :name => "MyString",
      :image_data => "MyText",
      :address => "MyString",
      :suburb => "MyString",
      :state => "MyString",
      :postcode => 1,
      :about => "MyText",
      :roasting_schedule => "MyText",
      :pickup => false
    ))
  end

  it "renders new store form" do
    render

    assert_select "form[action=?][method=?]", stores_path, "post" do

      assert_select "input[name=?]", "store[user_id]"

      assert_select "input[name=?]", "store[name]"

      assert_select "textarea[name=?]", "store[image_data]"

      assert_select "input[name=?]", "store[address]"

      assert_select "input[name=?]", "store[suburb]"

      assert_select "input[name=?]", "store[state]"

      assert_select "input[name=?]", "store[postcode]"

      assert_select "textarea[name=?]", "store[about]"

      assert_select "textarea[name=?]", "store[roasting_schedule]"

      assert_select "input[name=?]", "store[pickup]"
    end
  end
end
