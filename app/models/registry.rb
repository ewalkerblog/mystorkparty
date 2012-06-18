class Registry < ActiveRecord::Base
  attr_accessible :due_date, :gender, :present_id, :theme, :user_id, :presents_attributes, :party_name, :name
  validates :user_id, presence: true
  validates :name, :gender, :due_date, :theme, presence: true, uniqueness: true
  VALID_PARTY_NAME_REGEX = /\A[\w+\-.]+\z/
  validates :party_name, presence: true, uniqueness: true, format: { with: VALID_PARTY_NAME_REGEX }
  belongs_to :user
  has_many :presents
  accepts_nested_attributes_for :presents, allow_destroy: true
  extend FriendlyId
  friendly_id :party_name
  
  def self.search(search)
  # if search is not empty
  if search
    find(:all, :conditions => ["party_name LIKE ?", "%#{search}%"])
  # if search is empty return all
  else
    find(:all)
  end
end

end

