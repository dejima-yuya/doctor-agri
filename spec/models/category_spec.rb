require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "アソシエーションについて" do
    it { should have_many(:surveys)}
    it { should have_many(:trainings).dependent(:destroy)}
  end
  describe "バリデーションについて" do
    it { should validate_presence_of(:title)}
    it { should validate_length_of(:title).is_at_most(20) } 
  end
end