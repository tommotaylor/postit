class Post < ActiveRecord::Base
  
  include Voteable

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :comments

  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true


  before_save :create_slug

  
  def create_slug
    self.slug = self.title.parameterize
  end

  def to_param
    slug
  end

end