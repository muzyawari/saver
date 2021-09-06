class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :folders, dependent: :destroy
  has_many :sections, through: :folders
  has_one_attached :photo
  validates :first_name, :last_name, :email, :phone, :gender, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  enum gender: %i[male female]
end
