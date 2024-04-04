class User < ApplicationRecord
  has_many :submissions, class_name: "Song", inverse_of: :submitter, foreign_key: :submitter_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
