class User < ApplicationRecord
  #userから見て:todo_listsは多の関係→has_many
  has_many :todo_lists
  #パスワードのセキュア化
  has_secure_password
  #EMAILに大文字があったら小文字に変換(バグを減らすため)
  before_save { self.email = email.downcase }
  #EMAILの正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #presence→カラムの存在確認, length→長さ, uniqueness→一意かどうか, format→正規表現
  validates :name, presence: true, length: {maximum: 100}
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true
end
