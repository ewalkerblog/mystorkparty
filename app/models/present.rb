class Present < ActiveRecord::Base
  set_inheritance_column "not_sti"
  attr_accessible :brand, :color, :quantity, :registry_id, :type
  belongs_to :registry
  validates :brand, :color, :type, presence: true, length: { maximum: 20, minimum: 3 }
  validates :quantity, presence: true, length: { maximum: 5, minimum: 0 }
  PRESENT_TYPES = [ "Bodysuit", "Onesies", "Undershirts", "Vests", "Pajamas", "Blankets", "Sweaters", "Jackets", "Rompers", "Socks", "Booties", "Mittens", "Hats", "Swimsuit", "Fleecesuit", "Crib", "Cradle", "Bassinet", "Matress", "Sheets", "Soft Blankets", "Heavy Blankets", "Rocking Chair", "Arm Chair", "Music Player", "Baby Monitor", "Night Light", "Dresser", "Toy Basket", "Swing Chair", "Bouncy Chair", "Changing Table", "Changing Pad", "Diapers", "Wipes", "Cream", "Tissues", "Baby Bath", "Baby Soap", "Baby Shampoo", "Baby Hairbrush", "Baby Bottle", "Bottle Warmer", "Bottle Sterilizer", "Bibs", "Burb Cloths", "High Chair", "Pacifier", "Formula", "Nursing Pillow", "Baby Nail Clipper", "Baby Thermometer", "Car Seat", "Stroller", "Diaper Bag", "Baby Carrier", "Sling" ]
  end