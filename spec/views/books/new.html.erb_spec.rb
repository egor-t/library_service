require 'rails_helper'

RSpec.describe "books/new", type: :view do
  let!(:author) { Author.create! name: "Estas" }

  before(:each) do
    assign(:book, Book.new(
      :title => "MyString",
      :image_url => "MyText",
      author_id: author.id
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "textarea[name=?]", "book[image_url]"
    end
  end
end
