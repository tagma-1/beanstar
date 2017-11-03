require 'rails_helper'

RSpec.describe "stores/index", type: :view do
  before(:each) do
    assign(:stores, [
      Store.create!(
        :user => nil,
        :name => "Name",
        :image_data => "MyText",
        :address => "Address",
        :suburb => "Suburb",
        :state => "State",
        :postcode => 2,
        :about => "MyText",
        :roasting_schedule => "MyText",
        :pickup => false
      ),
      Store.create!(
        :user => nil,
        :name => "Name",
        :image_data => "MyText",
        :address => "Address",
        :suburb => "Suburb",
        :state => "State",
        :postcode => 2,
        :about => "MyText",
        :roasting_schedule => "MyText",
        :pickup => false
      )
    ])
  end

  it "renders a list of stores" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Suburb".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
