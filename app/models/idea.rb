class Idea < ActiveRecord::Base
  enum quality: [:Swill, :Plausible, :Genius]

  validates :quality, inclusion: { in: qualities.keys }
  validates_presence_of :title
  validates_presence_of :body

  before_save :check_length

  def upvote
    self[:quality] += 1
  end

  def downvote
    self[:quality] -= 1
  end

  def check_length
    if self.body.length > 100
      truncate(self.body)
    end
  end

  def truncate(body)
    if self.body.chars.last != " "
      self.body = self.body[0..-2]
      truncate(self.body)
    end
  end
end
