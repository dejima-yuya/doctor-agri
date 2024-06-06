class User < ApplicationRecord
  has_many :surveys, dependent: :destroy

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :phone_number, presence: true, format: { with: /\A\+?\d+\z/, message: "は半角数字のみで入力してください" },
                                            length: { minimum: 10, maximum: 11, message: "は10桁または11桁で入力してください" }
  validate :phone_number_must_not_contain_hyphens
  validates :password, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  before_destroy :ensure_at_least_one_admin_remains
  before_update :ensure_at_least_one_admin_remains_on_update
  
  def self.search_by_name(keyword)
    if keyword.present?
      where('name LIKE ?', "%#{keyword}%")
    else
      all
    end
  end

  private
  def ensure_at_least_one_admin_remains
    if admin?
      if User.where(admin: true).count <= 1
        errors.add(:base, "管理者が0人になるため削除できません")
        throw(:abort)
      end
    end
  end

  def ensure_at_least_one_admin_remains_on_update
    if admin_changed? && admin == false && User.where(admin: true).count <= 1
      errors.add(:base, "管理者が0人になるため権限を変更できません")
      throw(:abort)
    end
  end

  def phone_number_must_not_contain_hyphens
    if phone_number.present? && phone_number.match?(/-/)
      errors.add(:phone_number, "にハイフンは入れないでください")
    end
  end
end
