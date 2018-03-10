require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  let(:valid_attributes) { { title: "test", image_url: "book_url" } }
  let(:invalid_attributes) { { title: '', image_url: ''} }

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

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      book = Book.create! valid_attributes
      get :edit, params: { id: book.to_param }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Book" do
        expect {
          post :create, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post :create, params: { book: valid_attributes }
        expect(response).to redirect_to(Book.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { book: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { title: "new title", image_url: "new_book_url" } }

      it "redirects to the book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: new_attributes}
        expect(response).to redirect_to(book)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete :destroy, params: { id: book.to_param }
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete :destroy, params: { id: book.to_param }
      expect(response).to redirect_to(books_url)
    end
  end

end
