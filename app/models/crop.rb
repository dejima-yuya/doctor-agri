class Crop < ApplicationRecord
  has_many :trainings, dependent: :destroy
end
