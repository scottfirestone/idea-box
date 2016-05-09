class Idea < ActiveRecord::Base
  enum quality: [:swill, :possible, :genius]

  validates :quality, inclusion: { in: qualities.keys }
end
