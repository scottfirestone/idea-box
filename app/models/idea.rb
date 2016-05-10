class Idea < ActiveRecord::Base
  enum quality: [:Swill, :Possible, :Genius]

  validates :quality, inclusion: { in: qualities.keys }
  #validation for  empty title and body
end
