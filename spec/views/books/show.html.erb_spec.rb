require 'rails_helper'

RSpec.describe "books/show", type: :view do
  let!(:author) { Author.create! name: "Estas" }
  let(:avatar) { File.new(Rails.root + 'spec/factories/images/dangerous.jpeg') }
  let(:group) { Group.create! name: 'Sport' }

  before(:each) do
    @book = assign(:book, Book.create!(
      title: "Title",
      avatar: avatar,
      group: group
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
