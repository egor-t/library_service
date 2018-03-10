require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:image_url) }
  it { should validate_length_of(:title) }
  it { should validate_length_of(:image_url) }
end
