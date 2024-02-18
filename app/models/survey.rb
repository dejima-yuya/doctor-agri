class Survey < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :is_useful, inclusion: [true, false]
  validates :is_request, inclusion: [true, false]

  belongs_to :user
  belongs_to :category
  belongs_to :crop

  def self.category_ranking
    Survey.joins(:category).select('categories.id as category_id, categories.title as category_title, count(surveys.id) as surveys_count').group('categories.id').order('surveys_count DESC')
  end

  def self.crop_ranking
    Survey.joins(:crop).select('crops.id as crop_id, crops.title as crop_title, count(surveys.id) as surveys_count').group('crops.id').order('surveys_count DESC')
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "crop_id", "title", "is_useful", "is_request", "user_name"]
  end

  scope :search_by_user_name, -> (query){ joins(:user).where("users.name LIKE ?", '%' + query + '%' ) }
end
