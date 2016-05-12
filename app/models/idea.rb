class Idea < ActiveRecord::Base
  enum quality: [:Swill, :Plausible, :Genius]

  validates :quality, inclusion: { in: qualities.keys }
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :quality

  def upvote
    self[:quality] += 1
  end

  def downvote
    self[:quality] -= 1
  end
end
