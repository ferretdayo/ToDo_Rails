class TodoList < ApplicationRecord
  belongs_to :user

  #文字列は４０文字まで
  validates :content, presence: true, length: {maximum: 40}
  #数字は整数型のみ
  validates :priority, presence: true, numericality: { only_integer: true}
  validates :user_id, presence: true
end
