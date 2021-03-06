class Member < ApplicationRecord

  has_secure_password

  # 背番号バリデータ
  validates :number, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 100,
      allow_blank: true
    },
    uniqueness: true
  
  # ユーザー名バリデータ
  validates :name, presence: true,
    format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/, allow_blank: true, message: :invalid_member_name },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }

  # 氏名バリデータ
  validates :full_name, presence: true,
    length: { maximum: 20 }
  
  # メールアドレスバリデータ
  validates :email, email: { allow_blank: true }

  class << self
    def search(query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
