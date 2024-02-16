require 'rails_helper'

RSpec.describe Training, type: :model do
  describe "アソシエーションについて" do
    it { should belong_to(:crop)}
    it { should belong_to(:category)}
  end
end