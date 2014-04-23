class Post < ActiveRecord::Base;
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :comments

  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true

  has_many :votes, as: :voteable

  def total_votes
  	self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end

end