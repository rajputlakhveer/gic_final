class Blog < ApplicationRecord
  has_one_attached :poster
  has_many_attached :images
end