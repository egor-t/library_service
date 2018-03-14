require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  let!(:author) { Author.create! name: "Aloha" }
  let(:avatar) { File.new(Rails.root + 'spec/factories/images/dangerous.jpeg') }
  let(:valid_attributes) { { title: "test", avatar: avatar, author_ids: [author.id] } }
  let(:invalid_attributes) { { title: '' } }

  describe "GET #index" do
    it "returns a success response" do
      book = Book.create! valid_attributes
      get :index
      expect(response).to be_success
    end
  end

describe "GET #show" do
    it "returns a success response" do
      book = Book.create! valid_attributes
      get :show, params: { id: book.id }
      expect(response).to be_success
    end
  end
end
