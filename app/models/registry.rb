class Registry < ActiveRecord::Base
  attr_accessible :due_date, :gender, :present_id, :theme, :user_id, :presents_attributes
  validates :user_id, presence: true
  belongs_to :user
  has_many :presents
  accepts_nested_attributes_for :presents, allow_destroy: true
end
