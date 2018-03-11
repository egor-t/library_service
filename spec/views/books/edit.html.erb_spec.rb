require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  let!(:author) { Author.create! name: "Estas" }

  before(:each) do
    @book = assign(:book, Book.create!(
      :title => "MyString",
      :image_url => "MyText",
      author_id: author.id
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "textarea[name=?]", "book[image_url]"
    end
  end
end
