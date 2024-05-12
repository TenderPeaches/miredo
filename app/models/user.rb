class User < ApplicationRecord
  has_many :submissions, class_name: "Song", inverse_of: :submitter, foreign_key: :submitter_id
  has_many :user_favorites, dependent: :destroy
  has_many :favorites, through: :user_favorites, source: :song
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #def favorites
  #  songs
  #end

  def is_admin?
      self.is_admin
  end
end
