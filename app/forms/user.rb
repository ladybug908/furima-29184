class UserDonation

  include ActiveModel::Model
  attr_accessor :nickname, :email, :password, :encrypted_password, :frist_name, :family_name, :frist_name_kana, :family_name_kana, :birth

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

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.create(
      nickname: nickname
      email: email,
      password: password,
      encrypted_password: encrypted_password,
      frist_name: frist_name,
      family_name: family_name,
      frist_name_kana: frist_name_kana,
      family_name_kana: family_name_kana,
      birth: birth
      )
  end

end
