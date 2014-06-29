class Post < ActiveRecord::Base;
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :comments

  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true

  has_many :votes, as: :voteable

  before_save :create_slug

  def total_votes
  	self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end

  def create_slug
    self.slug = self.title.parameterize
  end

  def to_param
    slug
  end

end