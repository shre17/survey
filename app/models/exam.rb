class Exam < ApplicationRecord
  has_many :users
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions,reject_if: proc { |attributes| attributes['title'].blank? }

  # def questions_for_form
  #   collection = questions.where(question_id: id)
  #   collection.any? ? collection : questions.build
  # end
  
end
