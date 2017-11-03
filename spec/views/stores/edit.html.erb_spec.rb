require 'rails_helper'

RSpec.describe "stores/edit", type: :view do
  before(:each) do
    @store = assign(:store, Store.create!(
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

  it "renders the edit store form" do
    render

    assert_select "form[action=?][method=?]", store_path(@store), "post" do

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
