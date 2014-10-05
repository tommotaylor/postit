class User < ActiveRecord::Base;
  has_many :posts
  has_many :comments

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}

  has_many :votes

  before_save :create_slug

  def create_slug
  	self.slug = self.username.parameterize
  end


  def to_param
  	slug
  end
 
  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator'
  end

end
