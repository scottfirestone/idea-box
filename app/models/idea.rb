class Idea < ActiveRecord::Base
  enum quality: [:Swill, :Possible, :Genius]

  validates :quality, inclusion: { in: qualities.keys }
  #validation for  empty title and body

  def upvote
    self[:quality] += 1
  end

  def downvote
    self[:quality] -= 1
  end
end
