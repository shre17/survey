class Question < ApplicationRecord
  belongs_to :exam  
  has_many :answers, dependent: :destroy
  
  accepts_nested_attributes_for :answers,reject_if: proc { |attributes| attributes['title'].blank? }
  
end
