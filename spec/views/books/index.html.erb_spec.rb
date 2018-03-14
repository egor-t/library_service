require 'rails_helper'

RSpec.describe "books/index", type: :view do
  let!(:author) { Author.create! name: "Estas" }
  let(:avatar) { File.new(Rails.root + 'spec/factories/images/dangerous.jpeg') }
  let(:group) { Group.create! name: 'Sport' }

  before(:each) do
    assign(:books, [
      Book.create!(
        title: "Title",
        avatar: avatar,
        group: group
      ),
      Book.create!(
        title: "Title",
        avatar: avatar,
        group: group
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
