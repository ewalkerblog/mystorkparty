class Present < ActiveRecord::Base
  set_inheritance_column "not_sti"
  attr_accessible :brand, :color, :quantity, :registry_id, :type
  belongs_to :registry
  validates :brand, :color, :type, presence: true, length: { maximum: 20, minimum: 3 }
  validates :quantity, presence: true, length: { maximum: 20, minimum: 0 }
end
