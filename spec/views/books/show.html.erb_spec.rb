require 'rails_helper'

RSpec.describe "books/show", type: :view do
  let!(:author) { Author.create! name: "Estas" }

  before(:each) do
    @book = assign(:book, Book.create!(
      :title => "Title",
      :image_url => "MyText",
      author_id: author.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
