class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :folders, dependent: :destroy
  has_many :sections, through: :folders
  has_many :tasks, through: :sections

  has_many :bookmark_lists, dependent: :destroy
  has_many :bookmarks, through: :bookmark_lists
  has_many :notifications, as: :recipient, dependent: :destroy
  has_one_attached :photo
  # validates :first_name, :last_name, :email, :phone, :gender, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  enum gender: %i[male female]
end
