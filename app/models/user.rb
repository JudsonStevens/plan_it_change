class User < ApplicationRecord
  has_many :events_users
  has_many :events, through: :events_users
  has_many :posts
  has_secure_password
  
  before_validation {
    (self.email = self.email.to_s.downcase) &&
    (self.username = self.username.to_s.downcase) &&
    (self.city = self.city.to_s.downcase) &&
    (self.state = self.state.to_s.downcase)
  }

  validates_length_of       :password, minimum: 6, allow_nil: true, allow_blank: false
  validates_confirmation_of :password, allow_nil: true, allow_blank: false

  validates_presence_of     :email, :username, :city, :state
  validates_uniqueness_of   :email, :username

  def can_modify_user?(user_id)
    id.to_s == user_id.to_s
  end

  def is_admin?
    role == 'admin'
  end

  def owns_event?(event)
    event.owner == self.email
  end
end
