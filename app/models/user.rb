class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,:frist_name, :family_name, :frist_name_kana, :family_name_kana, :birth, presence: true

  validates :email, format: { with: /\A[\w\-._]+@[\w\-._]+\.[A-Za-z]+\z/ }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  NAME_REGEX =  /\A[ぁ-んァ-ン一-龥]+\z/
  validates_format_of :frist_name,:family_name, with: NAME_REGEX

  NAME_KANA_REGEX = /\A[ァ-ンー－]+\z/ 
  validates_format_of :frist_name_kana,:family_name_kana, with: NAME_KANA_REGEX

  has_many :items
end
