class Present < ActiveRecord::Base
  set_inheritance_column "not_sti"
  attr_accessible :brand, :color, :quantity, :registry_id, :type
  belongs_to :registry
  validates :brand, :color, :quantity, :type, presence: true
end
