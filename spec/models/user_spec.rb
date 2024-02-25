require 'rails_helper'

RSpec.describe User, type: :model do
  describe "アソシエーションについて" do
    it { should have_many(:surveys).dependent(:destroy) }
  end
  
  describe "バリデーションについて" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:phone_number)}
    it { should validate_presence_of(:password)}

    it { should allow_value('+1234567890').for(:phone_number) }
    it { should_not allow_value('123-456-7890').for(:phone_number).with_message('にハイフンは入れないでください') }
    it { should validate_length_of(:phone_number).is_at_least(10).is_at_most(11).with_message('は10桁または11桁で入力してください') }
    it { should_not allow_value('abc1234567').for(:phone_number).with_message('は半角数字のみで入力してください') }
  end

  describe "あいまい検索について" do
    it 'Taroという名前で検索した場合、user1が含まれ、user2が含まれないこと' do
      user1 = User.create!(name: 'Taro', phone_number: '09012345678', email: "taro@gmail.com", password: 'password')
      user2 = User.create!(name: 'Jiro', phone_number: '08012345678', email: "jiro@gmail.com", password: 'password')
      expect(User.search_by_name('Taro')).to include(user1)
      expect(User.search_by_name('Taro')).not_to include(user2)
    end
  end

  describe "コールバック" do
    context '管理者ユーザーが1人のみの場合' do
      before do
        @admin_user = User.create!(name: '管理者ユーザー', phone_number: '09012345678', email: 'admin@example.com', password: 'password', admin: true)
      end  

      it '管理者ユーザーを削除しようとするとエラーが発生する' do
        expect { @admin_user.destroy }.not_to change(User, :count)
        expect(@admin_user.errors[:base]).to include("管理者が0人になるため削除できません")
      end

      it '管理者ユーザーを削除しようとするとエラーが発生する' do
        @admin_user.admin = false
        @admin_user.save
        expect(@admin_user.errors[:base]).to include("管理者が0人になるため権限を変更できません")
      end
    end
  end
end