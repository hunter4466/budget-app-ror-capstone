class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :entities, foreign_key: 'user_id', class_name: 'Entity'
  has_many :groups, foreign_key: 'user_id', class_name: 'Group'
end
