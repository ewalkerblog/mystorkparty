class Registry < ActiveRecord::Base
  attr_accessible :due_date, :gender, :present_id, :theme, :user_id, :presents_attributes, :party_name, :name
  validates :user_id, presence: true
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

