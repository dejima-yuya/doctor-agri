class Category < ApplicationRecord
  has_many :trainings, dependent: :destroy
end
