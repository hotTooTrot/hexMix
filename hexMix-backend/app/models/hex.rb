class Hex < ActiveRecord::Base
  belongs_to :palettes
  validates :hex1, :hex2, :hex3, :hex4, :hex5, presence: true
  validates :hex1, :hex2, :hex3, :hex4, :hex5, length: { minimum: 3 }
end
