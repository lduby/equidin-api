class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
    # Relation with Profile
  has_one :profile
    # UID must not be blank
  before_validation do
    self.uid = licence if uid.blank?
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
