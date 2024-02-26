require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe "アソシエーションについて" do
    it { should belong_to(:user)}
    it { should belong_to(:category)}
    it { should belong_to(:crop)}
  end
  
  describe "バリデーションについて" do
    it { should validate_presence_of(:title)}
    it { should validate_length_of(:title).is_at_most(200) }
    it { should validate_inclusion_of(:is_useful).in_array([true, false]) }
    it { should validate_inclusion_of(:is_request).in_array([true, false]) }
  end

  describe "ランキング機能について" do
    before do
      # FactoryBotを使用してアンケートを作成
      user = create(:user, name: "user01", email: "user01@gmail.com", phone_number: "1111111111", admin: false, password: "testtest")
      strawberry = create(:crop, title: "イチゴ")
      sweet_potato = create(:crop, title: "さつまいも")
      grape = create(:crop, title: "ぶどう")
      raising_seedlings = create(:category, title: "育苗")
      management = create(:category, title: "管理")
      harvest = create(:category, title: "収穫")
      create(:survey, title: "イチゴの育苗方法", is_useful: true, is_request: true, category: raising_seedlings, crop: strawberry, user: user)
      create(:survey, title: "さつまいもの育苗方法", is_useful: true, is_request: true, category: raising_seedlings, crop: sweet_potato, user: user)
      create(:survey, title: "ぶどうの育苗方法", is_useful: true, is_request: true, category: raising_seedlings, crop: grape, user: user)
      create(:survey, title: "イチゴの管理方法", is_useful: true, is_request: true, category: management, crop: strawberry, user: user)
      create(:survey, title: "さつまいもの管理方法", is_useful: true, is_request: true, category: management, crop: sweet_potato, user: user)
      create(:survey, title: "イチゴの収穫方法", is_useful: true, is_request: true, category: harvest, crop: strawberry, user: user)
    end

    it "アンケートに含まれる各カテゴリーの「タイトル」と「累計数」を取得する & 各カテゴリーの累計数の降順で並び替える" do
      category_ranking = Survey.category_ranking
      expect(category_ranking.first.category_title).to eq("育苗")
      expect(category_ranking.first.surveys_count).to eq(3)
    end
    it "アンケートに含まれる各作物の「タイトル」と「累計数」を取得する & 各作物の累計数の降順で並び替える" do
      crop_ranking = Survey.crop_ranking
      expect(crop_ranking.first.crop_title).to eq("イチゴ")
      expect(crop_ranking.first.surveys_count).to eq(3)
    end
  end
end
