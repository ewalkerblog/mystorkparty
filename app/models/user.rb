class User < ActiveRecord::Base
  has_one :registry
  before_create :setup_default_role_for_new_users
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :present_id, :name
  # attr_accessible :title, :body
  VALID_NAME_REGEX = /\A[\w+\-.]+\z/
  validates :name, presence: true, uniqueness: true, format: { with: VALID_NAME_REGEX }, length: { maximum: 15, minimum: 2 }
  ROLES = %w[admin default banned]

  private

  def setup_default_role_for_new_users
    if self.role.blank?
      self.role = "default"
    end
  end
end
