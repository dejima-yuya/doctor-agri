require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe"self.category_ranking" do
    before do
      # カテゴリーを作成する
      category01 = Category.create(title:"育苗")
      category02 = Category.create(title:"管理")
      category03 = Category.create(title:"収穫")
      # 作物の種類を作成する
      crop01 = Crop.create(title:"イチゴ")
      crop02 = Crop.create(title:"さつまいも")
      crop03 = Crop.create(title:"ぶどう")
      # ユーザーを作成する
      admin = User.create(name:"admin", email:"admin@gmail.com", phone_number:"0000000000", admin:true, password:"testtest")
      user01 = User.create(name:"user01", email:"user01@gmail.com", phone_number:"1111111111", admin:false, password:"testtest")
      user02 = User.create(name:"user02", email:"user02@gmail.com", phone_number:"2222222222", admin:false, password:"testtest")
      user03 = User.create(name:"user03", email:"user03@gmail.com", phone_number:"3333333333", admin:false, password:"testtest")
      # アンケートを作成する
      survey01 = Survey.create(title:"イチゴの育苗方法", is_useful:true, is_request:true, category:category01, crop:crop01, user:user01)
      survey02 = Survey.create(title:"さつまいもの育苗方法", is_useful:true, is_request:false, category:category01, crop:crop02, user:user02)
      survey03 = Survey.create(title:"ぶどうの育苗方法", is_useful:false, is_request:true, category:category01, crop:crop03, user:user03)
      survey04 = Survey.create(title:"イチゴの管理方法", is_useful:false, is_request:false, category:category02, crop:crop01, user:user01)
      survey05 = Survey.create(title:"さつまいもの管理方法", is_useful:true, is_request:false, category:category02, crop:crop02, user:user02)
      survey06 = Survey.create(title:"イチゴの収穫方法", is_useful:false, is_request:true, category:category03, crop:crop01, user:user01)
    end
    it "アンケートに含まれる各カテゴリーの「タイトル」と「累計数」を取得する & 各カテゴリーの累計数の降順で並び替える" do
      def self.category_ranking
        Survey.joins(:category).select('categories.title as category_title, count(surveys.id) as surveys_count').group('categories.id').order('surveys_count DESC')
      end
    end
    it "アンケートに含まれる各作物の「タイトル」と「累計数」を取得する & 各作物の累計数の降順で並び替える" do
      def self.crop_ranking
        Survey.joins(:crop).select('crops.title as crop_title, count(surveys.id) as surveys_count').group('crops.id').order('surveys_count DESC')
      end
    end
  end
end
