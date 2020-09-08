class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, :birth, presence: true

         with_options presence: true do
           validates :frist_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
           validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
           validates :frist_name_kana, format: { with: /\A[ァ-ンー－]+\z/ }
           validates :family_name_kana, format: { with: /\A[ァ-ンー－]+\z/ }
         end
       
         validates :email, format: { with: /\A[\w\-._]+@[\w\-._]+\.[A-Za-z]+\z/ }
       
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX

end