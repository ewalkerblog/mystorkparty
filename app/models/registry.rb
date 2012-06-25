class Registry < ActiveRecord::Base
  attr_accessible :due_date, :gender, :present_id, :theme, :user_id, :presents_attributes, :name
  validates :user_id, presence: true
  validates :gender, :due_date, :theme, presence: true, length: { maximum: 25, minimum: 3 }
  VALID_NAME_REGEX = /\A[\w+\-.]+\z/
  validates :name, presence: true, uniqueness: true, format: { with: VALID_NAME_REGEX }, length: { maximum: 25, minimum: 3 }
  belongs_to :user
  has_many :presents
  accepts_nested_attributes_for :presents, allow_destroy: true
  extend FriendlyId
  friendly_id :name
  
  def self.search(search)
  # if search is not empty
  if search
    find(:all, :conditions => ["name LIKE ?", "%#{search}%"])
  # if search is empty return all
  else
    find(:all)
  end
end

end

