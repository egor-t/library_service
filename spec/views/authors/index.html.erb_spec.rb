require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        :name => "Name",
        :belongs_to => "Belongs To",
        : => ""
      ),
      Author.create!(
        :name => "Name",
        :belongs_to => "Belongs To",
        : => ""
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Belongs To".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
