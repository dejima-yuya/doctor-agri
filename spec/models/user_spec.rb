require 'rails_helper'

RSpec.describe Training, type: :model do
  describe "アソシエーションについて" do
    it { should belong_to(:crop)}
    it { should belong_to(:category)}
  end
  describe "バリデーションについて" do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:content)}
  end
end