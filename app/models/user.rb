class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  attr_accessor :bg_color, :txt_color
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :folders, dependent: :destroy
  has_many :sections, through: :folders
  has_many :tasks, through: :sections
  has_many :notifications, as: :recipient
  has_one_attached :photo
  # validates :first_name, :last_name, :email, :phone, :gender, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  enum gender: %i[male female]
end
