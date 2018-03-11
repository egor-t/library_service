require 'rails_helper'

RSpec.describe "books/index", type: :view do
  let!(:author) { Author.create! name: "Estas" }

  before(:each) do
    assign(:books, [
      Book.create!(
        :title => "Title",
        image_url: "image_url",
        author_id: author.id
      ),
      Book.create!(
        title: "Title",
        image_url: "image_url",
        author_id: author.id
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
